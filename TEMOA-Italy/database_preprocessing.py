import pandas as pd
import numpy as np
import sqlite3
import time


# ---------------------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------------------

def _table_exists(conn, table_name):
    """Return True if `table_name` exists in the SQLite DB."""
    cur = conn.execute(
        "SELECT name FROM sqlite_master WHERE type='table' AND name=?",
        (table_name,),
    )
    return cur.fetchone() is not None


def _replace_table_rows(df, table, conn):
    """
    Replace ALL rows of `table` with the contents of `df`.

    We DELETE existing rows and INSERT new ones (instead of pandas'
    if_exists='replace', which would DROP the table and lose its PK/FK
    constraints). The table schema is therefore preserved.
    """
    if df is None:
        return
    cur = conn.cursor()
    cur.execute(f"DELETE FROM {table}")
    if not df.empty:
        df.to_sql(table, conn, index=False, if_exists='append')
    conn.commit()


def _interp_extrap(df, key_cols, time_col, value_col, time_periods,
                   value_dtype=float):
    """
    Linearly interpolate `value_col` over `time_col` within each unique
    combination of `key_cols`, then constant-extrapolate forward past the
    last anchor. Ancillary columns (units, notes, ...) are carried over
    from the left-side anchor of each segment.

    Parameters
    ----------
    df : DataFrame
        Sparse anchor points loaded from the v4 table.
    key_cols : list[str]
        Columns that identify a unique series (everything that is part of
        the table's primary key except `time_col`).
    time_col : str
        Name of the time-dimension column. Typically 'period' or 'vintage'.
    value_col : str
        Name of the value column to interpolate (e.g. 'efficiency',
        'activity', 'cost').
    time_periods : list[int]
        Sorted list of model milestone years (from the time_period table,
        excluding the terminal boundary year).
    value_dtype : type
        Cast each interpolated value to this type. Use `int` for lifetime,
        `float` for everything else.

    Returns
    -------
    DataFrame
        A new DataFrame with one row per (key, milestone period) present in
        the interpolation/extrapolation range, in the column order:
        key_cols + [time_col, value_col] + ancillary_cols.
    """
    if df.empty:
        return df.copy()

    ancillary_cols = [c for c in df.columns
                      if c not in key_cols + [time_col, value_col]
                      and not c.startswith('_')]

    out = []
    # sort=False preserves the original group ordering — useful for diff'ing
    grouped = df.groupby(key_cols, sort=False, dropna=False)
    for keyvals, sub in grouped:
        if not isinstance(keyvals, tuple):
            keyvals = (keyvals,)
        keymap = dict(zip(key_cols, keyvals))
        sub = sub.sort_values(by=[time_col], ignore_index=True)
        n = len(sub)
        for i in range(n):
            t_i = sub[time_col].iloc[i]
            v_i = sub[value_col].iloc[i]
            ancil = {c: sub[c].iloc[i] for c in ancillary_cols}
            if i < n - 1:  # interpolation segment [t_i, t_{i+1})
                t_next = sub[time_col].iloc[i + 1]
                v_next = sub[value_col].iloc[i + 1]
                segment = [t for t in time_periods if t_i <= t < t_next]
                for t in segment:
                    if t == t_i:
                        v = v_i
                    else:
                        v = v_i + (v_next - v_i) * (t - t_i) / (t_next - t_i)
                    out.append({**keymap, time_col: int(t),
                                value_col: value_dtype(v), **ancil})
            else:  # constant extrapolation past the last anchor
                tail = [t for t in time_periods if t >= t_i]
                for t in tail:
                    out.append({**keymap, time_col: int(t),
                                value_col: value_dtype(v_i), **ancil})
    if not out:
        return df.iloc[0:0].copy()
    result = pd.DataFrame(out)
    column_order = key_cols + [time_col, value_col] + ancillary_cols
    return result[column_order]


def _status_line(idx, total, label, dt):
    """Format a status line in the same style as the v3 script."""
    return "{:>1} {:>2} {:>1} {:>2} {:>1} {:>50} {:>6} {:>1}".format(
        '[', idx, '/', total, ']', label,
        np.format_float_positional(abs(dt), 2), 's'
    )


# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------

def preprocess_database(sqlite_database):
    """Preprocess a TEMOA v4 SQLite database in place."""

    conn = sqlite3.connect(sqlite_database)
    # We DELETE+INSERT a lot. Turn FKs off so we don't trip over ordering
    # issues when the destination tables reference periods or operators.
    conn.execute("PRAGMA foreign_keys = OFF")

    lifetime_default = 40
    print_i = 0
    print_status = True

    # Which sections print their resulting DataFrame at the end (debugging).
    print_outcome = {
        'emission_activity':                False,
        'limit_emission':                   False,
        'lifetime_process':                 False,
        'efficiency':                       False,
        'limit_tech_input_split':           False,
        'limit_tech_output_split':          False,
        'currency':                         False,
        'cost_invest':                      False,
        'cost_fixed':                       False,
        'cost_variable':                    False,
        'cost_emission':                    False,
        'loan_rate':                        False,
        'limit_capacity':                   False,
        'limit_activity':                   False,
        'demand':                           False,
        'capacity_factor_process':          False,
        'capacity_credit':                  False,
        'construction_input':               False,
    }
    # Which sections actually write back the interpolated table.
    save_tosql = {k: True for k in print_outcome}

    # -------------------- Time periods --------------------
    # In v4: time_period(sequence, period, flag). flag is a label that lives
    # in time_period_type — typically 'e' (existing) and 'f' (future).
    time_periods_df = pd.read_sql(
        "SELECT period, flag FROM time_period ORDER BY period", conn)
    # Drop the terminal milestone (TEMOA convention: last entry is a
    # boundary marker, not a model period)
    if len(time_periods_df) > 0:
        time_periods_all = list(time_periods_df['period'])[:-1]
    else:
        time_periods_all = []
    time_periods = time_periods_all  # alias to mirror v3 naming inside loops

    time_existing = list(
        time_periods_df.loc[time_periods_df['flag'] == 'e', 'period']
    )
    if not time_existing:
        raise RuntimeError(
            "No existing time periods (flag='e') found in time_period.")

    base_year = time_existing[-1]  # last existing period is the model base year

    print('_______________________________________________________________________')
    print("{:>62}".format('Output code of database_preprocessing_v4.py:'))


    # =====================================================================
    # emission_activity
    # =====================================================================
    # Equivalent to the v3 EmissionActivity block. Has three sub-steps:
    #   (a) compute new emission_activity rows from commodity_emission_factor
    #       (OPTIONAL — skipped if the table is missing/empty);
    #   (b) aggregate child emissions onto super-commodities via
    #       emission_aggregation (OPTIONAL — skipped if missing/empty);
    #   (c) linearly interpolate over vintage and forward-extrapolate.
    # If the optional tables (a) and (b) are missing, only (c) runs.

    start_time = time.time()

    Efficiency = pd.read_sql("SELECT * FROM efficiency", conn)

    # ---- (a) emission_activity from commodity_emission_factor ----
    # In v4-native, commodity_emission_factor is an OPTIONAL table.
    # Assumed columns: (emis_comm, input_comm, ef, units, notes).
    # If your local schema also has a `region` column, the SELECT below
    # still works (we simply don't use it — emission_activity rows pick up
    # the region from the matching efficiency row, as in v3).
    EmissionActivity_CEF = pd.DataFrame(
        columns=['region', 'emis_comm', 'input_comm', 'tech', 'vintage',
                 'output_comm', 'activity', 'units', 'notes'])
    if _table_exists(conn, 'commodity_emission_factor'):
        CEF = pd.read_sql("SELECT * FROM commodity_emission_factor", conn)
        rows = []
        for i in range(len(CEF)):
            eff_i = Efficiency[Efficiency['input_comm'] == CEF['input_comm'].iloc[i]]
            eff_i = eff_i.reset_index(drop=True)
            for j in range(len(eff_i)):
                rows.append({
                    'region':      eff_i['region'].iloc[j],
                    'emis_comm':   CEF['emis_comm'].iloc[i],
                    'input_comm':  CEF['input_comm'].iloc[i],
                    'tech':        eff_i['tech'].iloc[j],
                    'vintage':     int(eff_i['vintage'].iloc[j]),
                    'output_comm': eff_i['output_comm'].iloc[j],
                    'activity':    float(CEF['ef'].iloc[i] /
                                         eff_i['efficiency'].iloc[j]),
                    'units':       '',
                    'notes':       '',
                })
        if rows:
            EmissionActivity_CEF = pd.DataFrame(rows)
    else:
        print("  [info] Table 'commodity_emission_factor' not found — "
              "skipping CEF computation step.")

    # ---- merge pre-existing emission_activity with CEF-derived rows ----
    EmissionActivity_PEF = pd.read_sql("SELECT * FROM emission_activity", conn)

    # Composite string key over the PK columns (region, emis_comm, input_comm,
    # tech, vintage, output_comm). Same trick as the v3 script.
    def _ea_key(df):
        return (df['region'].astype(str) + '|' + df['emis_comm'].astype(str) +
                '|' + df['input_comm'].astype(str) + '|' + df['tech'].astype(str) +
                '|' + df['vintage'].astype(str) + '|' + df['output_comm'].astype(str))

    if not EmissionActivity_PEF.empty:
        EmissionActivity_PEF['_k'] = _ea_key(EmissionActivity_PEF)
    if not EmissionActivity_CEF.empty:
        EmissionActivity_CEF['_k'] = _ea_key(EmissionActivity_CEF)

    keys_PEF = set(EmissionActivity_PEF['_k']) if not EmissionActivity_PEF.empty else set()
    keys_CEF = set(EmissionActivity_CEF['_k']) if not EmissionActivity_CEF.empty else set()
    all_keys = list(keys_PEF | keys_CEF)

    merged = []
    for k in all_keys:
        pef_i = EmissionActivity_PEF[EmissionActivity_PEF['_k'] == k] \
            if not EmissionActivity_PEF.empty else pd.DataFrame()
        cef_i = EmissionActivity_CEF[EmissionActivity_CEF['_k'] == k] \
            if not EmissionActivity_CEF.empty else pd.DataFrame()
        if len(pef_i) == 0 and len(cef_i) == 1:
            r = cef_i.iloc[0].to_dict()
        elif len(pef_i) == 1 and len(cef_i) == 0:
            r = pef_i.iloc[0].to_dict()
        elif len(pef_i) == 1 and len(cef_i) == 1:
            r = pef_i.iloc[0].to_dict()
            r['activity'] = float(pef_i['activity'].iloc[0] +
                                  cef_i['activity'].iloc[0])
            if abs(r['activity']) < 1e-5:
                continue  # skip negligible values (numerical noise)
        else:
            # Multiple rows in PEF for the same key — degenerate but
            # tolerable: just keep the first PEF row.
            r = pef_i.iloc[0].to_dict()
        r.pop('_k', None)
        merged.append(r)

    EmissionActivity = pd.DataFrame(merged) if merged else \
        EmissionActivity_PEF.drop(columns=['_k'], errors='ignore').copy()

    # ---- (b) aggregate child emissions via emission_aggregation ----
    # In v4-native, emission_aggregation is an OPTIONAL table.
    # Assumed columns: (emis_agg, emis_comm, emis_agg_weight).
    if _table_exists(conn, 'emission_aggregation'):
        EA = pd.read_sql("SELECT * FROM emission_aggregation", conn)
        for global_comm in list(dict.fromkeys(EA['emis_agg'])):
            EA_i = EA[EA['emis_agg'] == global_comm]
            child_list = list(dict.fromkeys(EA_i['emis_comm']))
            EAct_i = EmissionActivity[
                EmissionActivity['emis_comm'].isin(child_list)
            ].reset_index(drop=True)
            if EAct_i.empty:
                continue
            # Group by everything except emis_comm
            EAct_i['_k'] = (
                EAct_i['region'].astype(str) + '|' +
                EAct_i['input_comm'].astype(str) + '|' +
                EAct_i['tech'].astype(str) + '|' +
                EAct_i['vintage'].astype(str) + '|' +
                EAct_i['output_comm'].astype(str)
            )
            for k in list(dict.fromkeys(EAct_i['_k'])):
                sub = EAct_i[EAct_i['_k'] == k].reset_index(drop=True)
                act = 0.0
                for i in range(len(sub)):
                    weight = EA_i[EA_i['emis_comm'] == sub['emis_comm'].iloc[i]]
                    if not weight.empty:
                        act += sub['activity'].iloc[i] * float(
                            weight['emis_agg_weight'].iloc[0])
                if abs(act) >= 1e-2:
                    new_row = {
                        'region':      sub['region'].iloc[0],
                        'emis_comm':   global_comm,
                        'input_comm':  sub['input_comm'].iloc[0],
                        'tech':        sub['tech'].iloc[0],
                        'vintage':     int(sub['vintage'].iloc[0]),
                        'output_comm': sub['output_comm'].iloc[0],
                        'activity':    float(act),
                        'units':       sub['units'].iloc[0],
                        'notes':       sub['notes'].iloc[0],
                    }
                    EmissionActivity = pd.concat(
                        [EmissionActivity, pd.DataFrame([new_row])],
                        ignore_index=True
                    )
    else:
        print("  [info] Table 'emission_aggregation' not found — "
              "skipping aggregation step.")

    # ---- (c) interpolate/extrapolate over vintage ----
    EmissionActivity = _interp_extrap(
        EmissionActivity,
        key_cols=['region', 'emis_comm', 'input_comm', 'tech', 'output_comm'],
        time_col='vintage',
        value_col='activity',
        time_periods=time_periods,
    )
    EmissionActivity = EmissionActivity.sort_values(
        by=['region', 'tech', 'emis_comm', 'input_comm', 'output_comm', 'vintage'],
        ignore_index=True,
    )

    if save_tosql['emission_activity']:
        _replace_table_rows(EmissionActivity, 'emission_activity', conn)
    if print_outcome['emission_activity']:
        pd.set_option('display.max_rows', len(EmissionActivity))
        pd.set_option('display.max_columns', 10)
        print("\nemission_activity DataFrame\n\n", EmissionActivity[:1000])
        pd.reset_option('display.max_rows')
        pd.reset_option('display.max_columns')

    print_i += 1
    if print_status:
        print(_status_line(print_i, len(print_outcome),
                           'emission_activity calculated and interpolated.',
                           time.time() - start_time))

    # =====================================================================
    # limit_emission   (v3 EmissionLimit)
    # =====================================================================
    # v4 PK is (region, period, emis_comm, operator). 'operator' splits the
    # table into Min/Max equivalents — we interpolate within each operator
    # independently by including it as a key column.
    start_time = time.time()
    LimitEmission = pd.read_sql("SELECT * FROM limit_emission", conn)
    LimitEmission = _interp_extrap(
        LimitEmission,
        key_cols=['region', 'emis_comm', 'operator'],
        time_col='period',
        value_col='value',
        time_periods=time_periods,
    )
    if save_tosql['limit_emission']:
        _replace_table_rows(LimitEmission, 'limit_emission', conn)
    print_i += 1
    if print_status:
        print(_status_line(print_i, len(print_outcome),
                           'limit_emission interpolated.',
                           time.time() - start_time))

    # =====================================================================
    # lifetime_process
    # =====================================================================
    # value_dtype=int matches the v3 behavior (life_process was cast to int).
    start_time = time.time()
    LifetimeProcess = pd.read_sql("SELECT * FROM lifetime_process", conn)
    LifetimeProcess = _interp_extrap(
        LifetimeProcess,
        key_cols=['region', 'tech'],
        time_col='vintage',
        value_col='lifetime',
        time_periods=time_periods,
        value_dtype=int,
    )
    if save_tosql['lifetime_process']:
        _replace_table_rows(LifetimeProcess, 'lifetime_process', conn)
    print_i += 1
    if print_status:
        print(_status_line(print_i, len(print_outcome),
                           'lifetime_process interpolated.',
                           time.time() - start_time))

    # Reload LifetimeTech and LifetimeProcess into Python — needed later by
    # the cost_fixed / cost_variable / capacity_credit sections.
    LifetimeTech_df = pd.read_sql("SELECT * FROM lifetime_tech", conn)
    LifetimeProcess_df = LifetimeProcess.copy()

    # =====================================================================
    # efficiency
    # =====================================================================
    start_time = time.time()
    Efficiency = pd.read_sql("SELECT * FROM efficiency", conn)
    Efficiency = _interp_extrap(
        Efficiency,
        key_cols=['region', 'input_comm', 'tech', 'output_comm'],
        time_col='vintage',
        value_col='efficiency',
        time_periods=time_periods,
    )
    if save_tosql['efficiency']:
        _replace_table_rows(Efficiency, 'efficiency', conn)
    print_i += 1
    if print_status:
        print(_status_line(print_i, len(print_outcome),
                           'efficiency interpolated.',
                           time.time() - start_time))

    # =====================================================================
    # limit_tech_input_split (and its _annual variant)
    # =====================================================================
    # v3 had TechInputSplit + MinInputGroup + MaxInputGroup as 3 separate
    # tables; in v4 they all land in limit_tech_input_split[_annual],
    # discriminated by `operator` and split between two tables depending on
    # whether the tech is annual or not. We interpolate each table
    # independently.
    start_time = time.time()
    for tbl in ('limit_tech_input_split', 'limit_tech_input_split_annual'):
        df = pd.read_sql(f"SELECT * FROM {tbl}", conn)
        df = _interp_extrap(
            df,
            key_cols=['region', 'input_comm', 'tech', 'operator'],
            time_col='period',
            value_col='proportion',
            time_periods=time_periods,
        )
        if save_tosql['limit_tech_input_split']:
            _replace_table_rows(df, tbl, conn)
    print_i += 1
    if print_status:
        print(_status_line(print_i, len(print_outcome),
                           'limit_tech_input_split interpolated.',
                           time.time() - start_time))

    # =====================================================================
    # limit_tech_output_split (and its _annual variant)
    # =====================================================================
    start_time = time.time()
    for tbl in ('limit_tech_output_split', 'limit_tech_output_split_annual'):
        df = pd.read_sql(f"SELECT * FROM {tbl}", conn)
        df = _interp_extrap(
            df,
            key_cols=['region', 'tech', 'output_comm', 'operator'],
            time_col='period',
            value_col='proportion',
            time_periods=time_periods,
        )
        if save_tosql['limit_tech_output_split']:
            _replace_table_rows(df, tbl, conn)
    print_i += 1
    if print_status:
        print(_status_line(print_i, len(print_outcome),
                           'limit_tech_output_split interpolated.',
                           time.time() - start_time))

    # =====================================================================
    # currency conversion   (optional)
    # =====================================================================
    # In v4-native, `currency` and `currency_tech` are OPTIONAL tables.
    # Assumed columns:
    #   currency       : (curr, value, ref, notes)
    #         where exactly one row has ref='REF' (the reference currency)
    #   currency_tech  : (tech, curr, notes)
    # If either table is missing, this section is skipped: costs are left
    # in whatever currency they were entered with.
    start_time = time.time()
    if _table_exists(conn, 'currency') and _table_exists(conn, 'currency_tech'):
        Currency = pd.read_sql("SELECT * FROM currency", conn)
        CurrencyTech = pd.read_sql("SELECT * FROM currency_tech", conn)

        if Currency.empty or CurrencyTech.empty:
            print("  [info] currency/currency_tech empty — skipping conversion.")
        else:
            ref_mask = Currency['ref'].astype(str).str.upper() == 'REF'
            if not ref_mask.any():
                print("  [warning] No row with ref='REF' in currency — "
                      "skipping conversion.")
            else:
                reference = float(Currency.loc[ref_mask, 'value'].iloc[0])
                # Build a quick lookup: tech -> conversion factor
                #   factor = currency.value[ currency.curr == currency_tech.curr ] / reference
                ct = CurrencyTech.merge(
                    Currency[['curr', 'value']], on='curr', how='left')
                # If a tech is associated with a currency missing from the
                # `currency` table, value comes back NaN — warn and drop it.
                missing = ct[ct['value'].isna()]
                if not missing.empty:
                    for _, row in missing.iterrows():
                        print(f"  [warning] Tech '{row['tech']}' uses currency "
                              f"'{row['curr']}' which is not in the currency "
                              "table — left unconverted.")
                ct = ct.dropna(subset=['value']).copy()
                ct['_factor'] = ct['value'].astype(float) / reference
                tech2factor = dict(zip(ct['tech'], ct['_factor']))

                for cost_tbl, val_col in (
                        ('cost_invest', 'cost'),
                        ('cost_fixed', 'cost'),
                        ('cost_variable', 'cost')):
                    df = pd.read_sql(f"SELECT * FROM {cost_tbl}", conn)
                    if df.empty:
                        continue
                    # Multiply by per-tech factor; techs absent from the
                    # mapping keep their original cost.
                    df[val_col] = df.apply(
                        lambda r: (
                            float(np.format_float_scientific(
                                r[val_col] * tech2factor[r['tech']]
                            )) if r['tech'] in tech2factor
                            else r[val_col]
                        ),
                        axis=1,
                    )
                    _replace_table_rows(df, cost_tbl, conn)
    else:
        print("  [info] Table 'currency' or 'currency_tech' not found — "
              "skipping cost-currency conversion.")
    print_i += 1
    if print_status:
        print(_status_line(print_i, len(print_outcome),
                           'currency conversion applied.',
                           time.time() - start_time))

    # =====================================================================
    # cost_invest
    # =====================================================================
    start_time = time.time()
    CostInvest = pd.read_sql("SELECT * FROM cost_invest", conn)
    CostInvest = _interp_extrap(
        CostInvest,
        key_cols=['region', 'tech'],
        time_col='vintage',
        value_col='cost',
        time_periods=time_periods,
    )
    if save_tosql['cost_invest']:
        _replace_table_rows(CostInvest, 'cost_invest', conn)
    print_i += 1
    if print_status:
        print(_status_line(print_i, len(print_outcome),
                           'cost_invest interpolated.',
                           time.time() - start_time))

    # =====================================================================
    # cost_fixed   (lifetime-aware expansion)
    # =====================================================================
    # Unlike vintage-only tables, cost_fixed is indexed by BOTH `period` and
    # `vintage`. The v3 logic — preserved here — expands each input anchor
    # over the periods [vintage, vintage+lifetime), and (if multiple anchors
    # exist for the same region+tech) interpolates the cost linearly across
    # those periods. Lifetime comes from lifetime_tech, falling back to
    # lifetime_process, then to lifetime_default.
    start_time = time.time()
    CostFixed = pd.read_sql("SELECT * FROM cost_fixed", conn)

    out_rows = []
    if not CostFixed.empty:
        tech_already_considered = set()
        for i_tech in range(len(CostFixed)):
            region_i = CostFixed['region'].iloc[i_tech]
            tech_i = CostFixed['tech'].iloc[i_tech]
            key = (region_i, tech_i)
            if key in tech_already_considered:
                continue

            # Resolve the technology lifetime
            lifetime = lifetime_default
            lt_match = LifetimeTech_df[
                (LifetimeTech_df['region'] == region_i) &
                (LifetimeTech_df['tech'] == tech_i)
            ]
            if not lt_match.empty:
                lifetime = float(lt_match['lifetime'].iloc[0])
            # Per-vintage lifetimes for fall-back inside the loop
            lp_match = LifetimeProcess_df[
                (LifetimeProcess_df['region'] == region_i) &
                (LifetimeProcess_df['tech'] == tech_i)
            ]
            life_by_vintage = dict(zip(lp_match['vintage'], lp_match['lifetime'])) \
                if not lp_match.empty else {}

            # Find all rows that share this (region, tech) — these are the
            # anchor points whose values we'll interpolate across periods.
            anchors = CostFixed[
                (CostFixed['region'] == region_i) &
                (CostFixed['tech'] == tech_i)
            ].sort_values(by='period', ignore_index=True)

            if len(anchors) == 1:
                # Single anchor — expand from CostFixed.vintage of that row
                # over [vintage, vintage+lifetime) at each milestone period.
                only = anchors.iloc[0]
                for year_vintage in time_periods:
                    if year_vintage < only['vintage']:
                        continue
                    life = life_by_vintage.get(year_vintage, lifetime)
                    start = year_vintage
                    stop = year_vintage + life
                    for year_p in time_periods:
                        if not (start <= year_p < stop):
                            continue
                        if year_p <= time_existing[-1]:
                            continue  # skip existing periods
                        out_rows.append({
                            'region':  region_i,
                            'period':  int(year_p),
                            'tech':    tech_i,
                            'vintage': int(year_vintage),
                            'cost':    float(np.format_float_scientific(only['cost'])),
                            'units':   only['units'],
                            'notes':   only['notes'],
                        })
            else:
                # Multiple anchors — linearly interpolate the cost over
                # periods between consecutive anchor period values, then
                # constant-extrapolate forward.
                year_list = []
                cost_list = []
                for i in range(len(anchors) - 1):
                    y1, y2 = anchors['period'].iloc[i], anchors['period'].iloc[i + 1]
                    c1, c2 = anchors['cost'].iloc[i], anchors['cost'].iloc[i + 1]
                    for year in time_periods:
                        if y1 <= year < y2:
                            year_list.append(year)
                            cost_list.append(c1 + (year - y1) / (y2 - y1) * (c2 - c1))
                # Tail: extrapolate from the last anchor
                year_last = anchors['vintage'].iloc[-1]
                cost_last = anchors['cost'].iloc[-1]
                if year_last != time_periods[-2]:
                    for year in time_periods:
                        if year >= year_last:
                            year_list.append(year)
                            cost_list.append(cost_last)
                else:
                    year_list.append(year_last)
                    cost_list.append(cost_last)

                first_vintage = anchors['vintage'].iloc[0]
                for idx, year_vintage in enumerate(year_list):
                    if year_vintage < first_vintage:
                        continue
                    life = life_by_vintage.get(year_vintage, lifetime)
                    start = year_vintage
                    stop = year_vintage + life
                    for year_p in year_list:
                        if not (start <= year_p < stop):
                            continue
                        if year_p <= time_existing[-1]:
                            continue
                        out_rows.append({
                            'region':  region_i,
                            'period':  int(year_p),
                            'tech':    tech_i,
                            'vintage': int(year_vintage),
                            'cost':    float(np.format_float_scientific(cost_list[idx])),
                            'units':   anchors['units'].iloc[0],
                            'notes':   anchors['notes'].iloc[0],
                        })

            tech_already_considered.add(key)

    CostFixed = pd.DataFrame(out_rows) if out_rows else CostFixed.iloc[0:0]
    if save_tosql['cost_fixed']:
        _replace_table_rows(CostFixed, 'cost_fixed', conn)
    print_i += 1
    if print_status:
        print(_status_line(print_i, len(print_outcome),
                           'cost_fixed interpolated.',
                           time.time() - start_time))

    # =====================================================================
    # cost_variable   (lifetime-aware expansion — same algorithm as cost_fixed)
    # =====================================================================
    start_time = time.time()
    CostVariable = pd.read_sql("SELECT * FROM cost_variable", conn)

    out_rows = []
    if not CostVariable.empty:
        tech_already_considered = set()
        for i_tech in range(len(CostVariable)):
            region_i = CostVariable['region'].iloc[i_tech]
            tech_i = CostVariable['tech'].iloc[i_tech]
            key = (region_i, tech_i)
            if key in tech_already_considered:
                continue

            lifetime = lifetime_default
            lt_match = LifetimeTech_df[
                (LifetimeTech_df['region'] == region_i) &
                (LifetimeTech_df['tech'] == tech_i)
            ]
            if not lt_match.empty:
                lifetime = float(lt_match['lifetime'].iloc[0])
            lp_match = LifetimeProcess_df[
                (LifetimeProcess_df['region'] == region_i) &
                (LifetimeProcess_df['tech'] == tech_i)
            ]
            life_by_vintage = dict(zip(lp_match['vintage'], lp_match['lifetime'])) \
                if not lp_match.empty else {}

            anchors = CostVariable[
                (CostVariable['region'] == region_i) &
                (CostVariable['tech'] == tech_i)
            ].sort_values(by='period', ignore_index=True)

            if len(anchors) == 1:
                only = anchors.iloc[0]
                for year_vintage in time_periods:
                    if year_vintage < only['vintage']:
                        continue
                    life = life_by_vintage.get(year_vintage, lifetime)
                    start = year_vintage
                    stop = year_vintage + life
                    for year_p in time_periods:
                        if not (start <= year_p < stop):
                            continue
                        if year_p <= time_existing[-1]:
                            continue
                        out_rows.append({
                            'region':  region_i,
                            'period':  int(year_p),
                            'tech':    tech_i,
                            'vintage': int(year_vintage),
                            'cost':    float(np.format_float_scientific(only['cost'])),
                            'units':   only['units'],
                            'notes':   only['notes'],
                        })
            else:
                year_list = []
                cost_list = []
                for i in range(len(anchors) - 1):
                    y1, y2 = anchors['period'].iloc[i], anchors['period'].iloc[i + 1]
                    c1, c2 = anchors['cost'].iloc[i], anchors['cost'].iloc[i + 1]
                    for year in time_periods:
                        if y1 <= year < y2:
                            year_list.append(year)
                            cost_list.append(c1 + (year - y1) / (y2 - y1) * (c2 - c1))
                year_last = anchors['vintage'].iloc[-1]
                cost_last = anchors['cost'].iloc[-1]
                if year_last != time_periods[-2]:
                    for year in time_periods:
                        if year >= year_last:
                            year_list.append(year)
                            cost_list.append(cost_last)
                else:
                    year_list.append(year_last)
                    cost_list.append(cost_last)

                first_vintage = anchors['vintage'].iloc[0]
                for idx, year_vintage in enumerate(year_list):
                    if year_vintage < first_vintage:
                        continue
                    life = life_by_vintage.get(year_vintage, lifetime)
                    start = year_vintage
                    stop = year_vintage + life
                    for year_p in year_list:
                        if not (start <= year_p < stop):
                            continue
                        if year_p <= time_existing[-1]:
                            continue
                        out_rows.append({
                            'region':  region_i,
                            'period':  int(year_p),
                            'tech':    tech_i,
                            'vintage': int(year_vintage),
                            'cost':    float(np.format_float_scientific(cost_list[idx])),
                            'units':   anchors['units'].iloc[0],
                            'notes':   anchors['notes'].iloc[0],
                        })

            tech_already_considered.add(key)

    CostVariable = pd.DataFrame(out_rows) if out_rows else CostVariable.iloc[0:0]
    if save_tosql['cost_variable']:
        _replace_table_rows(CostVariable, 'cost_variable', conn)
    print_i += 1
    if print_status:
        print(_status_line(print_i, len(print_outcome),
                           'cost_variable interpolated.',
                           time.time() - start_time))

    # =====================================================================
    # cost_emission   (v3 CostEmission)
    # =====================================================================
    start_time = time.time()
    CostEmission = pd.read_sql("SELECT * FROM cost_emission", conn)
    CostEmission = _interp_extrap(
        CostEmission,
        key_cols=['region', 'emis_comm'],
        time_col='period',
        value_col='cost',
        time_periods=time_periods,
    )
    if save_tosql['cost_emission']:
        _replace_table_rows(CostEmission, 'cost_emission', conn)
    print_i += 1
    if print_status:
        print(_status_line(print_i, len(print_outcome),
                           'cost_emission interpolated.',
                           time.time() - start_time))

    # =====================================================================
    # loan_rate   (v3 DiscountRate)
    # =====================================================================
    start_time = time.time()
    LoanRate = pd.read_sql("SELECT * FROM loan_rate", conn)
    LoanRate = _interp_extrap(
        LoanRate,
        key_cols=['region', 'tech'],
        time_col='vintage',
        value_col='rate',
        time_periods=time_periods,
    )
    if save_tosql['loan_rate']:
        _replace_table_rows(LoanRate, 'loan_rate', conn)
    print_i += 1
    if print_status:
        print(_status_line(print_i, len(print_outcome),
                           'loan_rate interpolated.',
                           time.time() - start_time))

    # =====================================================================
    # limit_capacity
    #   Subsumes v3 MinCapacity, MaxCapacity, MinCapacityGroup, MaxCapacityGroup.
    #   The `operator` column distinguishes them; we interpolate per
    #   (region, tech_or_group, operator).
    # =====================================================================
    start_time = time.time()
    LimitCapacity = pd.read_sql("SELECT * FROM limit_capacity", conn)
    LimitCapacity = _interp_extrap(
        LimitCapacity,
        key_cols=['region', 'tech_or_group', 'operator'],
        time_col='period',
        value_col='capacity',
        time_periods=time_periods,
    )
    if save_tosql['limit_capacity']:
        _replace_table_rows(LimitCapacity, 'limit_capacity', conn)
    print_i += 1
    if print_status:
        print(_status_line(print_i, len(print_outcome),
                           'limit_capacity interpolated.',
                           time.time() - start_time))

    # =====================================================================
    # limit_activity
    #   Subsumes v3 MinActivity, MaxActivity, MinActivityGroup, MaxActivityGroup.
    # =====================================================================
    start_time = time.time()
    LimitActivity = pd.read_sql("SELECT * FROM limit_activity", conn)
    LimitActivity = _interp_extrap(
        LimitActivity,
        key_cols=['region', 'tech_or_group', 'operator'],
        time_col='period',
        value_col='activity',
        time_periods=time_periods,
    )
    if save_tosql['limit_activity']:
        _replace_table_rows(LimitActivity, 'limit_activity', conn)
    print_i += 1
    if print_status:
        print(_status_line(print_i, len(print_outcome),
                           'limit_activity interpolated.',
                           time.time() - start_time))

    # =====================================================================
    # demand   (driver-elasticity projection if those tables exist;
    #           otherwise plain interpolation)
    # =====================================================================
    # In v4-native:
    #   - `demand` is the canonical demand table (region, period,
    #     commodity, demand, units, notes).
    #   - `allocation`, `driver`, `elasticity` are OPTIONAL.
    # When all three optional tables are present, demand is projected from
    # the base-year value using driver growth × elasticity (same algorithm
    # as the v3 script). When any of them is missing, we fall back to
    # simple interpolation/extrapolation of the values already stored in
    # `demand` — analogous to the way EmissionLimit etc. are handled.
    # Manually inserted (non-base-year) rows in `demand` always override
    # the corresponding projected values.
    #
    # Assumed columns for the optional tables (v4 naming):
    #   allocation  : (demand_comm, driver_name, notes)
    #   driver      : (region, period, driver_name, driver, units, notes)
    #   elasticity  : (region, period, demand_comm, elasticity, units, notes)
    start_time = time.time()

    Demand = pd.read_sql("SELECT * FROM demand", conn)

    use_projection = (
        _table_exists(conn, 'allocation') and
        _table_exists(conn, 'driver') and
        _table_exists(conn, 'elasticity')
    )

    if use_projection:
        Allocation = pd.read_sql("SELECT * FROM allocation", conn)
        Driver = pd.read_sql("SELECT * FROM driver", conn)
        Elasticity = pd.read_sql("SELECT * FROM elasticity", conn)
        # If any of them is empty, treat them all as absent
        if Allocation.empty or Driver.empty or Elasticity.empty:
            use_projection = False

    if use_projection:
        # --- step 1: project demand from base year forward using drivers ---
        projected = []  # one row per (region, commodity, projected period)
        for i in range(len(Demand)):
            if Demand['period'].iloc[i] != base_year:
                continue
            region_i = Demand['region'].iloc[i]
            comm_i = Demand['commodity'].iloc[i]
            # First row of the projection sequence: the base-year value itself
            seq_rows = [{
                'region':    region_i,
                'period':    int(Demand['period'].iloc[i]),
                'commodity': comm_i,
                'demand':    float(Demand['demand'].iloc[i]),
                'units':     Demand['units'].iloc[i],
                'notes':     Demand['notes'].iloc[i],
            }]

            # Drivers attached to this demand commodity
            alloc_i = Allocation[Allocation['demand_comm'] == comm_i]
            for _, alloc_row in alloc_i.iterrows():
                # Filter Driver by (driver_name, region) so that
                # drv['driver'].iloc[k-1] is the previous period of the SAME
                # driver in the SAME region — not the previous row of an
                # unfiltered Driver table (which is the v3 bug).
                drv = Driver[
                    (Driver['driver_name'] == alloc_row['driver_name']) &
                    (Driver['region'] == region_i)
                ].sort_values(by='period', ignore_index=True)
                for k in range(len(drv)):
                    # Filter Elasticity by region too: base-year demand for
                    # region R must only spawn projection rows in region R.
                    elas = Elasticity[
                        (Elasticity['demand_comm'] == comm_i) &
                        (Elasticity['region'] == region_i) &
                        (Elasticity['period'] == drv['period'].iloc[k])
                    ]
                    if elas.empty:
                        continue
                    period_k = drv['period'].iloc[k]
                    if period_k == base_year:
                        # base-year row already added — skip
                        continue
                    # Project from the most recent previous projected value
                    prev_demand = seq_rows[-1]['demand']
                    drv_curr = float(drv['driver'].iloc[k])
                    drv_prev = float(drv['driver'].iloc[k - 1])
                    eps = float(elas['elasticity'].iloc[0])
                    new_val = prev_demand * (
                        1 + (drv_curr / drv_prev - 1) * eps)
                    seq_rows.append({
                        'region':    region_i,
                        'period':    int(period_k),
                        'commodity': comm_i,
                        'demand':    float(np.format_float_scientific(new_val)),
                        'units':     seq_rows[-1]['units'],
                        'notes':     '',
                    })
            # Drop the base-year duplicate from `projected` — base year is
            # taken straight from the canonical Demand table.
            projected.extend([r for r in seq_rows if r['period'] != base_year])

        Demand_proj = pd.DataFrame(projected) if projected else \
            pd.DataFrame(columns=Demand.columns)

        # --- step 2: any explicitly entered future-period row in Demand
        #     overrides the projected value for the same (region, commodity,
        #     period). Manually inserted rows take priority.
        manual = Demand[Demand['period'] > base_year].copy()
        if not Demand_proj.empty and not manual.empty:
            manual_keys = set(
                zip(manual['region'], manual['commodity'], manual['period'])
            )
            Demand_proj = Demand_proj[~Demand_proj.apply(
                lambda r: (r['region'], r['commodity'], r['period']) in manual_keys,
                axis=1
            )]

        # --- step 3: merge projections + manual (existing periods excluded) ---
        # v3 drops the base-year row from the projection and only keeps
        # non-base-year original rows. More generally, demand for any
        # existing period should be removed after preprocessing (the model
        # only optimises future periods). Same logic as cost_fixed /
        # cost_variable where "if year_p <= time_existing[-1]: continue".
        Demand = pd.concat([Demand_proj, manual], ignore_index=True)
        Demand = Demand.sort_values(
            by=['region', 'commodity', 'period'], ignore_index=True)
    else:
        # Fallback: plain linear interpolation / forward extrapolation, like
        # the other parameter tables. (No driver-elasticity projection.)
        print("  [info] allocation/driver/elasticity not all available — "
              "falling back to linear interpolation of `demand`.")
        Demand = _interp_extrap(
            Demand,
            key_cols=['region', 'commodity'],
            time_col='period',
            value_col='demand',
            time_periods=time_periods,
        )
        # Even in the fallback path, drop existing-period rows
        Demand = Demand[Demand['period'] > base_year].reset_index(drop=True)

    if save_tosql['demand']:
        _replace_table_rows(Demand, 'demand', conn)
    print_i += 1
    if print_status:
        print(_status_line(print_i, len(print_outcome),
                           'demand projected.',
                           time.time() - start_time))

    # =====================================================================
    # capacity_factor_process
    # =====================================================================
    start_time = time.time()
    CFP = pd.read_sql("SELECT * FROM capacity_factor_process", conn)
    CFP = _interp_extrap(
        CFP,
        key_cols=['region', 'season', 'tod', 'tech'],
        time_col='vintage',
        value_col='factor',
        time_periods=time_periods,
    )
    if save_tosql['capacity_factor_process']:
        _replace_table_rows(CFP, 'capacity_factor_process', conn)
    print_i += 1
    if print_status:
        print(_status_line(print_i, len(print_outcome),
                           'capacity_factor_process interpolated.',
                           time.time() - start_time))

    # =====================================================================
    # capacity_credit   (v3 CapacityCredit)
    # =====================================================================
    # v4 PK: (region, period, tech, vintage). The v3 logic does TWO passes:
    #   (1) piecewise-constant interpolation across VINTAGE (filling missing
    #       vintages with the previous vintage's average value);
    #   (2) linear interpolation across PERIOD within each vintage, capped
    #       at vintage + lifetime.
    start_time = time.time()
    CC = pd.read_sql("SELECT * FROM capacity_credit", conn)

    if not CC.empty:
        # ---- Pass 1: fill missing vintages with piecewise-constant values ----
        # MATCHES v3 SEMANTICS: v3 appends each new vintage row INSIDE the
        # time-period loop, so the next iteration can find it. That makes
        # the fill "chain forward" — every missing vintage takes its value
        # from the previous vintage (which may itself be a synthetic row
        # added by the previous iteration). Implemented here with a local
        # `working` list that grows during the loop.
        CC['_k'] = CC['region'].astype(str) + '|' + CC['tech'].astype(str)
        new_rows = []
        for k in list(dict.fromkeys(CC['_k'])):
            sub = CC[CC['_k'] == k].sort_values(
                by=['vintage', 'period'], ignore_index=True)
            # initial all_vintage snapshot, like v3 takes BEFORE the loop
            all_v = list(sub['vintage'])
            # rolling working set of (vintage -> [credit values]) so that
            # np.average over "previous vintage" can find rows we just added
            working = {}
            for _, row in sub.iterrows():
                working.setdefault(int(row['vintage']), []).append(float(row['credit']))
            for i in range(len(time_periods)):
                t = time_periods[i]
                # v3 condition: t not in initial all_vintage and t > all_v[0]
                if t not in all_v and t > all_v[0]:
                    prev_v = time_periods[i - 1]
                    if prev_v in working and working[prev_v]:
                        avg_val = float(np.average(working[prev_v]))
                        new_row = {
                            'region':  sub['region'].iloc[0],
                            'period':  int(t),
                            'tech':    sub['tech'].iloc[0],
                            'vintage': int(t),
                            'credit':  avg_val,
                            'notes':   sub['notes'].iloc[0],
                            '_k':      k,
                        }
                        new_rows.append(new_row)
                        # let subsequent iterations see this row
                        working.setdefault(int(t), []).append(avg_val)
        if new_rows:
            CC = pd.concat([CC, pd.DataFrame(new_rows)], ignore_index=True)
        CC = CC.drop(columns=['_k'])
        CC = CC.sort_values(by=['tech', 'vintage', 'period'], ignore_index=True)

        # ---- Pass 2: linear period-interpolation within each vintage,
        #              respecting the technology lifetime ----
        out_rows = []
        CC['_k'] = (CC['region'].astype(str) + '|' +
                    CC['tech'].astype(str) + '|' +
                    CC['vintage'].astype(str))
        for k in list(dict.fromkeys(CC['_k'])):
            sub = CC[CC['_k'] == k].sort_values(
                by=['vintage', 'period'], ignore_index=True)
            for i in range(len(sub)):
                tech_i = sub['tech'].iloc[0]
                region_i = sub['region'].iloc[i]
                vintage_i = sub['vintage'].iloc[i]
                # Resolve lifetime: tech > process > default
                lt = LifetimeTech_df[
                    (LifetimeTech_df['region'] == region_i) &
                    (LifetimeTech_df['tech'] == tech_i)
                ]
                lp = LifetimeProcess_df[
                    (LifetimeProcess_df['region'] == region_i) &
                    (LifetimeProcess_df['tech'] == tech_i) &
                    (LifetimeProcess_df['vintage'] == vintage_i)
                ]
                if not lt.empty:
                    lifetime = float(lt['lifetime'].iloc[0])
                elif not lp.empty:
                    lifetime = float(lp['lifetime'].iloc[0])
                else:
                    lifetime = lifetime_default

                p_i = sub['period'].iloc[i]
                c_i = sub['credit'].iloc[i]

                if i < len(sub) - 1:  # linear interpolation
                    p_next = sub['period'].iloc[i + 1]
                    c_next = sub['credit'].iloc[i + 1]
                    segment = [t for t in time_periods
                               if p_i <= t < p_next
                               and base_year < t < p_i + lifetime]
                    for j, t in enumerate(segment):
                        if t == p_i:
                            v = c_i
                        else:
                            v = c_i + (c_next - c_i) * (t - p_i) / (p_next - p_i)
                        out_rows.append({
                            'region':  region_i,
                            'period':  int(t),
                            'tech':    tech_i,
                            'vintage': int(vintage_i),
                            'credit':  float(v),
                            'notes':   sub['notes'].iloc[i],
                        })
                else:  # constant extrapolation
                    segment = [t for t in time_periods
                               if t >= p_i
                               and base_year < t < p_i + lifetime]
                    for t in segment:
                        out_rows.append({
                            'region':  region_i,
                            'period':  int(t),
                            'tech':    tech_i,
                            'vintage': int(vintage_i),
                            'credit':  float(c_i),
                            'notes':   sub['notes'].iloc[i],
                        })
        CC = pd.DataFrame(out_rows) if out_rows else CC.iloc[0:0].drop(
            columns=['_k'], errors='ignore')

    if save_tosql['capacity_credit']:
        _replace_table_rows(CC, 'capacity_credit', conn)
    print_i += 1
    if print_status:
        print(_status_line(print_i, len(print_outcome),
                           'capacity_credit interpolated.',
                           time.time() - start_time))

    # =====================================================================
    # construction_input   (v3 MaterialIntensity)
    # =====================================================================
    start_time = time.time()
    CI = pd.read_sql("SELECT * FROM construction_input", conn)
    CI = _interp_extrap(
        CI,
        key_cols=['region', 'input_comm', 'tech'],
        time_col='vintage',
        value_col='value',
        time_periods=time_periods,
    )
    if save_tosql['construction_input']:
        _replace_table_rows(CI, 'construction_input', conn)
    print_i += 1
    if print_status:
        print(_status_line(print_i, len(print_outcome),
                           'construction_input interpolated.',
                           time.time() - start_time))

    print('_______________________________________________________________________')

    # =====================================================================
    # Validation: sanity-check split proportions
    # =====================================================================
    # For limit_tech_input_split[_annual]: for each (region, period, tech),
    # the sum of `proportion` rows with operator='ge' must not exceed 1.
    # (Same for limit_tech_output_split[_annual].) The v3 script only
    # checked the Min* variants, not the Max* ones — we replicate that by
    # filtering on operator='ge'.

    def _check_split_sum(table, group_keys, value_col, op_filter='ge'):
        df = pd.read_sql(f"SELECT * FROM {table}", conn)
        if df.empty or 'operator' not in df.columns:
            return
        df = df[df['operator'] == op_filter]
        if df.empty:
            return
        sums = df.groupby(group_keys, as_index=False)[value_col].sum()
        # Round to 15 decimals to absorb floating-point noise
        sums[value_col] = sums[value_col].round(15)
        bad = sums[sums[value_col] > 1]
        if not bad.empty:
            pd.set_option('display.max_rows', len(bad))
            pd.set_option('display.max_columns', 10)
            print(f"\nWARNING: Errors detected in {table} "
                  f"(operator='{op_filter}'). "
                  "Sum of proportions > 1 for:\n\n", bad)
            pd.reset_option('display.max_rows')
            pd.reset_option('display.max_columns')

    _check_split_sum('limit_tech_input_split',
                     ['region', 'period', 'tech'], 'proportion')
    _check_split_sum('limit_tech_input_split_annual',
                     ['region', 'period', 'tech'], 'proportion')
    _check_split_sum('limit_tech_output_split',
                     ['region', 'period', 'tech'], 'proportion')
    _check_split_sum('limit_tech_output_split_annual',
                     ['region', 'period', 'tech'], 'proportion')

    # Re-enable FKs before closing
    conn.execute("PRAGMA foreign_keys = ON")
    conn.close()


if __name__ == "__main__":
    import sys
    if len(sys.argv) != 2:
        print("Usage: python database_preprocessing_v4.py <path_to_v4_database.sqlite>")
        sys.exit(1)
    preprocess_database(sys.argv[1])
