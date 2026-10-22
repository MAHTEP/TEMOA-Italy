import multiprocessing
import sqlite3

import pandas as pd
from tqdm import tqdm

# -----------------------------------------------------------------------------
# Input parameters to control the use of multiprocessing and set the algorithm outputs
# -----------------------------------------------------------------------------

processes = 1
print_set = True
toexcel_set = True
excel_name = "database_postprocessing"

# -----------------------------------------------------------------------------
# Input parameters to define the set of output to be postprocessed and their aggregation level
# -----------------------------------------------------------------------------

file = []

regions_list = []
tech_list = []
input_comm_list = []
output_comm_list = []
construction_input_comm_list = []
emissions_comm_list = []
periods_list = []

tech_dummies = ['CCUS_SNK_BCKSTP', 'DMY_IMP_TECH']

result_set = {
    "output_net_capacity": False,
    "output_built_capacity": False,
    "output_retired_capacity": False,
    "output_cost_invest": False,
    "output_cost_fixed": False,
    "output_cost_variable": False,
    "output_cost_emission": False,
    "output_flow_in": False,
    "output_flow_out": False,
    "output_construction_input": False,
    "output_emission": False
}

disaggregation = {
    "regions": False,
    "net_capacity_tech": False,
    "built_capacity_tech": False,
    "retired_capacity_tech": False,
    "cost_tech": False,
    "input_tech": False,
    "input_comm": False,
    "output_tech": False,
    "output_comm": False,
    "construction_input_tech": False,
    "construction_input_comm": False,
    "emissions_tech": False,
    "emissions_comm": False
}

# -----------------------------------------------------------------------------
# Definition of the results (no need to edit below this line)
# -----------------------------------------------------------------------------
# Each result is read from one TEMOA v4 output table and summed over the
# milestone years in `periods`:
#   table      : output table to read
#   value      : column (or sum of columns) holding the value
#   time       : time column matched against the milestone years
#                (period, or vintage for new capacity/investment/construction)
#   comm       : commodity column, its filter list and its disaggregation key
#   tech_key   : disaggregation key for the technology column
#   where      : extra SQL condition on the rows
#   needs      : 'tech' -> at least one technology must be listed in tech_list
#                'tech_or_comm' -> at least one technology or commodity

RESULTS = {
    "output_net_capacity": dict(
        table="output_net_capacity", value=["capacity"], time="period",
        tech_key="net_capacity_tech", needs="tech"),
    "output_built_capacity": dict(
        table="output_built_capacity", value=["capacity"], time="vintage",
        tech_key="built_capacity_tech", needs="tech"),
    "output_retired_capacity": dict(
        table="output_retired_capacity", value=["cap_eol", "cap_early"], time="period",
        tech_key="retired_capacity_tech", needs="tech"),
    "output_cost_invest": dict(
        table="output_cost", value=["d_invest"], time="vintage",
        tech_key="cost_tech", needs="tech"),
    "output_cost_fixed": dict(
        table="output_cost", value=["d_fixed"], time="period",
        tech_key="cost_tech", needs="tech"),
    "output_cost_variable": dict(
        table="output_cost", value=["d_var"], time="period",
        tech_key="cost_tech", needs="tech"),
    "output_cost_emission": dict(
        table="output_cost", value=["d_emiss"], time="period",
        tech_key="cost_tech", needs="tech"),
    "output_flow_in": dict(
        table="output_flow_in", value=["flow"], time="period",
        tech_key="input_tech", comm=("input_comm", "input_comm_list", "input_comm", "input_comm"),
        where="output_comm IS NOT NULL",  # rows without output_comm are construction inputs
        needs="tech_or_comm"),
    "output_flow_out": dict(
        table="output_flow_out", value=["flow"], time="period",
        tech_key="output_tech", comm=("output_comm", "output_comm_list", "output_comm", "output_comm"),
        needs="tech_or_comm"),
    "output_construction_input": dict(
        table="output_flow_in", value=["flow"], time="vintage",
        tech_key="construction_input_tech",
        comm=("input_comm", "construction_input_comm_list", "construction_input_comm", "construction_input_comm"),
        where="output_comm IS NULL",  # construction inputs have no output commodity
        needs="tech_or_comm"),
    "output_emission": dict(
        table="output_emission", value=["emission"], time="period",
        tech_key="emissions_tech", comm=("emis_comm", "emissions_comm_list", "emissions_comm", "emissions_comm"),
        needs="tech_or_comm"),
}

LISTS = {
    "input_comm_list": input_comm_list,
    "output_comm_list": output_comm_list,
    "construction_input_comm_list": construction_input_comm_list,
    "emissions_comm_list": emissions_comm_list,
}


def active_results():
    """Results requested in result_set that have the inputs they need."""
    active = []
    for name, spec in RESULTS.items():
        if not result_set.get(name, False):
            continue
        comm_list = LISTS[spec["comm"][1]] if "comm" in spec else []
        if spec["needs"] == "tech" and not tech_list:
            print(f"WARNING: No {name} found (tech_list is empty).")
            continue
        if spec["needs"] == "tech_or_comm" and not tech_list and not comm_list:
            print(f"WARNING: No {name} found (tech_list and {spec['comm'][1]} are empty).")
            continue
        active.append(name)
    return active


def get_periods(conn):
    """Milestone years to report: periods_list, or all the time_optimize periods."""
    if periods_list:
        return [int(p) for p in periods_list]
    future = pd.read_sql("SELECT period FROM time_period WHERE flag = 'f' ORDER BY period", conn)
    return [int(p) for p in future["period"]][:-1]  # last 'f' period is the end of the horizon


def read_rows(conn, table, scenario, where_extra, filters):
    """Read the rows of one scenario, filtered with parameterized IN (...) clauses."""
    where = ["scenario = ?"]
    params = [scenario]
    for column, values in filters:
        if values:
            where.append(f"{column} IN ({', '.join('?' * len(values))})")
            params.extend(values)
    if where_extra:
        where.append(where_extra)
    query = f"SELECT * FROM {table} WHERE " + " AND ".join(where)
    return pd.read_sql(query, conn, params=params)


def aggregate(df, value, time_col, keys, periods, file, scenario):
    """
    Sum `value` by `keys` for each milestone year, one column per year.
    Rows and year columns with only zeros are dropped.
    """
    labels = [label for _, label in keys]
    columns = ["file", "scenario"] + labels + periods
    if df.empty:
        return pd.DataFrame(columns=columns)
    df = df[df[time_col].isin(periods)].copy()
    df["_value"] = df[value].fillna(0).sum(axis=1)
    df = df.rename(columns={col: label for col, label in keys})
    if labels:
        table = df.pivot_table(index=labels, columns=time_col, values="_value", aggfunc="sum", fill_value=0)
        table = table.reindex(columns=periods, fill_value=0).reset_index()
    else:
        sums = df.groupby(time_col)["_value"].sum()
        table = pd.DataFrame([[sums.get(p, 0.0) for p in periods]], columns=periods)
    table.columns.name = None
    table[periods] = table[periods].astype(float)
    table = table[(table[periods] != 0).any(axis=1)]  # remove rows with only zeros
    table.insert(0, "scenario", scenario)
    table.insert(0, "file", file)
    table = table.sort_values(by=["file", "scenario"] + labels, ignore_index=True)
    table = table.loc[:, (table != 0).any(axis=0)]  # remove columns with only zeros
    return table


def function(args):
    file, scenario, active = args
    conn = sqlite3.connect(file)
    periods = get_periods(conn)
    out = {}

    for name in active:
        spec = RESULTS[name]
        time_col = spec["time"]
        filters = [("region", regions_list), ("tech", tech_list)]
        keys = []
        if disaggregation["regions"]:
            keys.append(("region", "region"))
        if disaggregation[spec["tech_key"]]:
            keys.append(("tech", "tech"))
        if "comm" in spec:
            column, list_name, disagg_key, label = spec["comm"]
            filters.append((column, LISTS[list_name]))
            if disaggregation[disagg_key]:
                keys.append((column, label))
        rows = read_rows(conn, spec["table"], scenario, spec.get("where"), filters)
        out[name] = aggregate(rows, spec["value"], time_col, keys, periods, file, scenario)

    # Check dummies: activity of dummy/backstop technologies
    check = pd.DataFrame()
    if tech_dummies:
        rows = read_rows(conn, "output_flow_out", scenario, None, [("tech", tech_dummies)])
        check = aggregate(rows, ["flow"], "period",
                          [("region", "region"), ("tech", "tech"), ("output_comm", "output_comm")],
                          periods, file, scenario)
    conn.close()
    return out, check


if __name__ == '__main__':

    # Assigning scenarios to the different processes
    file_list = []
    scenario_list = []
    for i_file in range(len(file)):
        conn = sqlite3.connect(file[i_file])
        output_objective = pd.read_sql("SELECT DISTINCT scenario FROM output_objective", conn)
        conn.close()
        for scenario in output_objective["scenario"]:
            file_list.append(file[i_file])
            scenario_list.append(scenario)

    # Decided once here, so that every process works on the same set of results
    active = active_results()
    inputs = [(f, s, active) for f, s in zip(file_list, scenario_list)]

    with multiprocessing.Pool(processes=processes) as pool:
        results = list(tqdm(pool.imap(function, inputs), total=len(inputs)))

    merged = {}
    for name in active:
        frames = [res[0][name] for res in results if not res[0][name].empty]
        merged[name] = pd.concat(frames, ignore_index=True) if frames else pd.DataFrame()
    check_frames = [res[1] for res in results if not res[1].empty]
    check_dummies = pd.concat(check_frames, ignore_index=True) if check_frames else pd.DataFrame()

    # Printing output
    if print_set:
        for name in active:
            print(f"\n{name}\n\n", merged[name].to_string(index=False, float_format='%.2f'))

    if len(check_dummies) != 0:
        print("\nWARNING: Dummy imports detected.\n\n", check_dummies.to_string(index=False, float_format='%.2f'))

    # Export to Excel
    if toexcel_set:
        with pd.ExcelWriter(excel_name + '.xlsx', engine='xlsxwriter') as writer:
            if len(check_dummies) != 0:
                check_dummies.to_excel(writer, sheet_name='check_dummies', index=False)
            for name in active:
                merged[name].to_excel(writer, sheet_name=name, index=False)
