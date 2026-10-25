# Database Generator, Preprocessing, and Postprocessing Algorithms - User Guide

## Introduction

This guide provides comprehensive instructions for using the Database Generator, Preprocessing, and Postprocessing Python algorithms. The **Generator** and **Preprocessing** scripts are necessary to prepare the SQLite database in a TEMOA-compliant format (TEMOA v4 schema) starting from the provided SQL text, while the **Postprocessing** script can be used to postprocess results.

## Prerequisites

Ensure you have the **temoa virtual environment** installed and activated in the console to guarantee compatibility with all dependencies. The scripts use `pandas`, `numpy`, and the Python `sqlite3` module; the postprocessing script also needs `tqdm` (progress bar) and `xlsxwriter` (Excel export). If any of them is missing from the environment, install it with `pip install tqdm xlsxwriter`.

## Repository Content

The GitHub repository includes several SQL codes, together with their associated SQLite databases and results. Each model is generated, preprocessed, and postprocessed with the same algorithms described in this guide, simply by listing their names in the generator script.

### Full model

- **TEMOA_Italy** is the full multi-sectoral model, representing all the sectors of the Italian energy system. It adopts a single spatial region and a time horizon from 2006 to 2050.

### Sectoral models

- **Commercial_Agriculture, Hydrogen_Sequestration, Industry, Residential, Transport** sectoral codes include the same data as the corresponding sectors of TEMOA_Italy. They are intended to be used for **testing model changes** and do not produce meaningful results, since they do not represent, for instance, prices and constraints related to the input commodities of such sectors. They also adopt a single spatial region and a time horizon from 2006 to 2050.
- **Power** includes the same data as the TEMOA_Italy power sector, integrated with a simplified modeling of the prices of the input commodities. It can therefore be used as a **stand-alone model** of the Italian power sector only, implemented on a single spatial region and a time horizon from 2006 to 2050.

### Multi-regional models

- **Power_20R** and **Power_Hydrogen_20R** are multi-regional implementations of the power sector and of the power and hydrogen sectors, respectively. They adopt **20 spatial regions**, corresponding to the 20 Italian administrative regions, and a time horizon from 2022 to 2050. Region-specific parameters (e.g. `cost_emission`) must be entered for each of the 20 regions: a region that is not listed in the `region` table makes TEMOA stop while building the model.

# Database Generator

## Overview

The `database_generator.py` script automates the process of generating, preprocessing, and optionally simplifying the SQLite databases of the TEMOA-Italy project. The script loops over the models listed in `sql_modules` and, for each of them, executes four steps controlled by Boolean flags, followed by a final optimization of the database:

1. **Deleting:** Removes an existing database if present.
2. **Reading:** Creates a new database by executing the SQL code of the model.
3. **Preprocessing:** Runs the Python preprocessing function.
4. **Simplifying (Optional):** Reduces the number of future time periods.
5. **Final Optimization:** Runs `VACUUM` on the database (always executed).

The flags and the simplification settings are shared by all the listed models: the whole list is generated with the same options, one model after the other.

## Key Components

- **Model List:** `sql_modules`, e.g. `['TEMOA_Italy']`. The entries are the **base names** of the models, without extension. Several models can be listed, e.g. `['TEMOA_Italy', 'Power']`: each entry is generated as a separate database, in the order they appear in the list.
- **File Names:** Derived from each entry of `sql_modules`: the SQL code is read from `<name>.sql` and the database is written to `<name>.sqlite`. There is no separate variable for the database file, so the two names always match.
- **Preprocessing Script:** `database_preprocessing.py`, imported as `from database_preprocessing import preprocess_database` and invoked as `preprocess_database(sqlite_database)`. It must be in the same folder as the generator.
- **Simplification Settings (Optional):** the `kept_years` list, defined at the top of the generator.

*Note:* Each model is announced in the console by printing its SQL file name, followed by one status line per executed step.

## Step-by-Step Breakdown

### 1. Deleting the Existing Database
- **Controlled by:** `Deleting = True`
- **Functionality:**
  - Checks if the database file of the model (`<name>.sqlite`) exists.
  - Deletes the file to ensure a clean slate for database creation.

### 2. Reading and Creating the Database
- **Controlled by:** `Reading = True`
- **Functionality:**
  - Connects to the SQLite database of the model (creates it if it doesn't exist).
  - Executes the SQL code of the model (e.g. `TEMOA_Italy.sql`) to define tables, relationships, and insert data.
  - SQL files are read with `utf-8-sig` encoding, so a leading BOM is handled transparently.

### 3. Preprocessing the Database
- **Controlled by:** `Preprocessing = True`
- **Functionality:**
  - Calls `preprocess_database()` from `database_preprocessing.py`, which rewrites the database in place (see [Database Preprocessing](#database-preprocessing)).
  - Involves interpolating and extrapolating sparse time series over the model milestone years, deriving emission factors, converting currencies, and projecting demand.
  - The generator sets `sys.dont_write_bytecode = True`, so importing the preprocessing script does not create a `__pycache__` folder.

### 4. Simplifying the Database (Optional)
- **Controlled by:** `Simplifying = False` *(set to `True` to enable)*
- **Functionality:**
  - Simplifies the model time horizon by keeping only the time periods listed in `kept_years`.
  - Runs after preprocessing, so it acts on the already interpolated tables.
  - Deletes the rows whose `period` is not in `kept_years` from the period-indexed tables: `capacity_credit`, `cost_fixed`, `cost_variable`, `cost_emission`, `demand`, `demand_specific_distribution`, `driver`, `elasticity`, `lifetime_survival_curve`, `limit_emission`, `limit_activity`, `limit_activity_share`, `limit_capacity`, `limit_capacity_share`, `limit_tech_input_split`, `limit_tech_input_split_annual`, `limit_tech_output_split`, `limit_tech_output_split_annual`.
  - Deletes the rows whose `vintage` is not in the **kept vintages** from the vintage-indexed tables: `capacity_credit`, `capacity_factor_process`, `construction_input`, `cost_invest`, `cost_fixed`, `cost_variable`, `efficiency`, `efficiency_variable`, `emission_activity`, `emission_embodied`, `emission_end_of_life`, `end_of_life_output`, `existing_capacity`, `lifetime_process`, `lifetime_survival_curve`, `limit_annual_capacity_factor`, `limit_new_capacity`, `limit_new_capacity_share`, `loan_lifetime_process`, `loan_rate`, `myopic_efficiency`, `reserve_capacity_derate`.
  - The kept vintages are the union of `kept_years` and the existing periods, read from `time_period` with flag `'e'`: the existing vintages are always kept, since they hold the existing capacity and the parameters of the existing stock.
  - Removes the dropped periods from `time_period`, again keeping the rows flagged `'e'`.
  - *Note:* the step issues a plain `DELETE` on each table of the two lists, so every one of them must exist in the database. A model whose SQL code does not create the full TEMOA v4 schema makes the simplification stop with an error; comment the missing tables out of the two lists before enabling the step.
  - *Note:* the last year of `time_period` is not a model period but marks the end of the time horizon. Include it in `kept_years`, as the default `[2010, 2020, 2030, 2040, 2050, 2060]` does with 2060, otherwise the last kept period becomes the end of the horizon and is no longer optimized.

### 5. Final Optimization
- **Command:** `VACUUM`
- **Purpose:**
  - Rebuilds the SQLite database to defragment the file and optimize storage.
  - Reduces file size and improves performance after data manipulations.
  - Executed unconditionally, on each model, at the end of its loop iteration.

## Modifying the Script

- **Select the models:** List in `sql_modules` the base names of the models to be generated.
- **Skip Deletion:** Set `Deleting = False` to retain the existing database.
- **Bypass SQL Execution:** Set `Reading = False` if no schema updates are needed.
- **Disable Preprocessing:** Set `Preprocessing = False` if preprocessing is unnecessary.
- **Enable Simplification:** Set `Simplifying = True` to reduce the number of future time periods, and edit `kept_years` accordingly.

*Note:* If `Preprocessing` is `False`, the database contains only the anchor values written in the SQL code, not the values at every milestone year.

## Usage

Run the generator script from the folder containing the SQL code(s) and `database_preprocessing.py`:

```bash
python database_generator.py
```

# Database Preprocessing

## Overview

`database_preprocessing.py` exposes a single entry point, `preprocess_database(sqlite_database)`, which preprocesses a TEMOA v4 database **in place**. Foreign keys are disabled for the duration of the run (`PRAGMA foreign_keys = OFF`) and re-enabled at the end. Each processed table is rewritten with a `DELETE` + `INSERT` rather than being dropped and recreated, so primary keys and foreign key constraints defined in the SQL code are preserved.

The SQL code only needs to contain the values at a few anchor years: the script fills in all the model milestone years.

## Time Periods

The milestone years are read from the `time_period` table:

- The last entry of `time_period` marks the end of the time horizon and is excluded from the milestone years.
- The **base year** is the last existing period (flag `'e'`). The database must contain at least one existing period, otherwise the script stops with an error.

## Setup Instructions

The input parameters are defined at the beginning of `preprocess_database()`:

- `lifetime_default`: Default lifetime value for technologies (40 years), used when neither `lifetime_process` nor `lifetime_tech` defines one.
- `print_status`: Set to `True` to enable console output (one timed status line per section).
- `print_outcome`: A dictionary keyed on the processed tables; set an entry to `True` to print the resulting DataFrame of that section for debugging. It is currently read by the `emission_activity` and `demand_specific_distribution` sections and by the tables processed in the final generic step.
- `save_tosql`: A dictionary with the same keys, controlling whether the processed data of each section is written back to the database. By default every section is saved. The currency conversion is always written back when it runs.

## Model Inputs

The script preprocesses and saves the following tables, in this order:

1. `emission_activity`
2. `limit_emission`
3. `lifetime_process`
4. `loan_lifetime_process`
5. `efficiency`
6. `limit_tech_input_split` and `limit_tech_input_split_annual`
7. `limit_tech_output_split` and `limit_tech_output_split_annual`
8. currency conversion of `cost_invest`, `cost_fixed`, `cost_variable`
9. `cost_invest`
10. `cost_fixed`
11. `cost_variable`
12. `cost_emission`
13. `loan_rate`
14. `limit_capacity`
15. `limit_activity`
16. `demand`
17. `capacity_factor_process`
18. `capacity_credit`
19. `construction_input`
20. `demand_specific_distribution`
21. `limit_activity_share`
22. `limit_capacity_share`
23. `rps_requirement`
24. `lifetime_survival_curve`
25. `emission_embodied`
26. `emission_end_of_life`
27. `end_of_life_output`
28. `limit_new_capacity`
29. `limit_new_capacity_share`
30. `limit_annual_capacity_factor`
31. `efficiency_variable`
32. `reserve_capacity_derate`

Tables 21-32 are skipped if they do not exist in the database.

### Extension tables

Seven tables are part of the schema but are not used by every model: `commodity_emission_factor`, `emission_aggregation`, `currency`, `currency_tech`, `allocation`, `driver`, `elasticity`. They drive three optional steps:

- computation of `emission_activity` from `commodity_emission_factor` and `emission_aggregation`;
- cost-currency conversion for `cost_invest`, `cost_fixed`, and `cost_variable` (requires both `currency` and `currency_tech`, with exactly one row of `currency` flagged `ref = 'REF'` as the reference currency);
- demand projection from a base-year value via driver growth × elasticity (requires `allocation`, `driver`, and `elasticity`, all populated).

Each step is guarded by a check on whether the corresponding tables are present and populated, so the script degrades gracefully: if an extension table is missing or empty, the step is skipped (an `[info]` line is printed) and the script falls back to plain interpolation/extrapolation of the values already stored in the tables.

## Processing Steps

1. **Data Extraction:** Loads each table from the SQLite database.
2. **Interpolation & Extrapolation:** For each series (all the primary key columns except the time column), values are linearly interpolated between the anchor years over the milestone years, and kept constant after the last anchor up to the end of the time horizon. No values are generated before the first anchor. The `units` and `notes` columns are taken from the preceding anchor.
3. **Specific Preprocessing for Key Tables:**
   - **emission_activity:** For each row of `commodity_emission_factor`, an emission factor equal to `ef / efficiency` is computed for every `efficiency` row with the same input commodity, and added to the value already stored in `emission_activity` for the same process (values below 1e-5 are dropped). If `emission_aggregation` is populated, the emissions of the child commodities are then summed, weighted by `emis_agg_weight`, into the aggregated commodity (values below 1e-2 are dropped). Finally, the table is interpolated over the vintages.
   - **lifetime_process / loan_lifetime_process:** Interpolated values are rounded to the closest integer (half up).
   - **Currency:** Each cost of `cost_invest`, `cost_fixed`, and `cost_variable` whose technology is listed in `currency_tech` is multiplied by the ratio between the value of its currency and the value of the reference currency. Technologies using a currency missing from `currency` are left unconverted, with a warning.
   - **cost_fixed / cost_variable:** These tables are indexed by both period and vintage. The anchors of each (region, technology) give one cost per vintage (constant if there is a single anchor; otherwise linear between the anchors and constant after the last one). Each vintage is then expanded to every milestone period within its lifetime (`lifetime_process`, else `lifetime_tech`, else `lifetime_default`). Rows in existing periods are dropped.
   - **demand:** If the projection tables are available, the base-year demand is projected forward period by period as `demand × (1 + (driver_t / driver_t-1 − 1) × elasticity)`, by region. Rows entered manually in `demand` for future periods override the projected values. Otherwise, `demand` is interpolated and extrapolated. In both cases, rows in existing periods are removed.
   - **capacity_credit:** Missing vintages are first filled with the value of the previous vintage; credits are then linearly interpolated over the periods of each vintage, within its lifetime and after the base year.
   - **demand_specific_distribution:** Missing milestone periods after the first anchor take the value of the previous period (no linear interpolation). The table is sorted by region, demand commodity, period, season, and time of day, following the order of `time_season` and `time_of_day`.
   - **lifetime_survival_curve:** Interpolated but **not** extrapolated after the last anchor, so that a process does not survive beyond the end of its curve.
4. **Validation:** For `limit_tech_input_split[_annual]` and `limit_tech_output_split[_annual]`, the script checks that, for each region, period, and technology, the sum of the `ge` proportions does not exceed 1. Violations are printed as warnings.
5. **Saving Results:** Saves the processed data back to the SQLite database if enabled in `save_tosql`.

## Usage

The preprocessing script is executed by the generator script. It can also be run alone on an existing database, passing the database path as argument:

```bash
python database_preprocessing.py TEMOA_Italy.sqlite
```

*Note:* Run the preprocessing only once on a database freshly generated from the SQL code. A second run would, for instance, add the emission factors derived from `commodity_emission_factor` to `emission_activity` again. To preprocess again, regenerate the database with the generator script.

# Database Postprocessing

## Setup Instructions

1. Solve the model with TEMOA: the postprocessing reads the `output_*` tables written by TEMOA in the output database.
2. Adjust the input parameters at the top of the postprocessing script:
   - `processes`: Number of parallel processes (e.g., `1` for single-threaded). Work is distributed over (database, scenario) pairs.
   - `print_set`: Set to `True` to print the results in the console.
   - `toexcel_set`: Set to `True` to export results to Excel.
   - `excel_name`: Define the output Excel file name (without extension).
   - `file`: List of database file paths. Scenarios are detected automatically by reading the `output_objective` table of each database.
   - `result_set`: Dictionary of Boolean flags selecting which outputs are postprocessed. Only the outputs set to `True` are computed, printed, and exported.
   - `tech_dummies`: List of dummy/backstop technologies (by default `CCUS_SNK_BCKSTP` and `DMY_IMP_TECH`) whose activity is checked in every scenario.

## Available Outputs

The script can postprocess the following outputs, read from the TEMOA v4 output tables:

| Output | Source table and value | Reported by |
|---|---|---|
| `output_net_capacity` | `output_net_capacity.capacity` | period |
| `output_built_capacity` | `output_built_capacity.capacity` | vintage |
| `output_retired_capacity` | `output_retired_capacity.cap_eol + cap_early` | period |
| `output_cost_invest` | `output_cost.d_invest` | vintage |
| `output_cost_fixed` | `output_cost.d_fixed` | period |
| `output_cost_variable` | `output_cost.d_var` | period |
| `output_cost_emission` | `output_cost.d_emiss` | period |
| `output_flow_in` | `output_flow_in.flow` (rows with an output commodity) | period |
| `output_flow_out` | `output_flow_out.flow` | period |
| `output_construction_input` | `output_flow_in.flow` (rows without an output commodity) | vintage |
| `output_emission` | `output_emission.emission` | period |

*Note:* Costs are the discounted costs (`d_*` columns) of the `output_cost` table.

## Input Parameters

- **Filtering Criteria:**
  - **General Criteria:** `regions_list`, `periods_list`
    - *Note:* An empty list means no filter: if `regions_list` is empty, all the regions are included.
    - *Note:* If `periods_list` is not provided, the script will automatically extract the list of `time_optimize` periods from the TEMOA database (all the future periods except the end of the time horizon) and use all of them. Each output is provided by periods, one column per milestone year.
    - *Note:* Outputs are summed over the regions, unless `disaggregation["regions"]` is `True`.
    - *Note:* Capacity and cost outputs require at least one entry in `tech_list`; flow, construction input, and emission outputs require at least one entry in `tech_list` or in the corresponding commodity list. Otherwise, the output is skipped and a warning is printed.
  - **Output-Specific Criteria:**
    - `output_net_capacity`: `regions_list`, `tech_list`
    - `output_built_capacity`: `regions_list`, `tech_list`
    - `output_retired_capacity`: `regions_list`, `tech_list`
    - `output_cost_invest`: `regions_list`, `tech_list`
    - `output_cost_fixed`: `regions_list`, `tech_list`
    - `output_cost_variable`: `regions_list`, `tech_list`
    - `output_cost_emission`: `regions_list`, `tech_list`
    - `output_flow_in`: `regions_list`, `tech_list`, `input_comm_list`
    - `output_flow_out`: `regions_list`, `tech_list`, `output_comm_list`
    - `output_construction_input`: `regions_list`, `tech_list`, `construction_input_comm_list`
    - `output_emission`: `regions_list`, `tech_list`, `emissions_comm_list`

- **Disaggregation Options:**
  - `disaggregation`: Dictionary of Boolean flags; a flag set to `True` keeps the corresponding column instead of summing over it.
    - `regions`: applies to all the outputs.
    - `net_capacity_tech`, `built_capacity_tech`, `retired_capacity_tech`, `cost_tech`: technologies of the capacity and cost outputs (`cost_tech` applies to all four cost outputs).
    - `input_tech`, `input_comm`: technologies and commodities of `output_flow_in`.
    - `output_tech`, `output_comm`: technologies and commodities of `output_flow_out`.
    - `construction_input_tech`, `construction_input_comm`: technologies and commodities of `output_construction_input`.
    - `emissions_tech`, `emissions_comm`: technologies and commodities of `output_emission`.
    - *Note:* Disaggregation by databases and scenarios is automatic: every table includes the `file` and `scenario` columns.

## Processing Steps

1. **Scenario Detection:** Reads the scenarios of each database from `output_objective`.
2. **Data Extraction:** For each (database, scenario) pair, reads the rows of the selected output tables that match the filtering lists.
3. **Aggregation:** Sums the values by milestone year and by the disaggregation columns. Rows and year columns containing only zeros are removed.
4. **Dummy Check:** Reports the activity (`output_flow_out`) of the technologies listed in `tech_dummies`, by region, technology, and output commodity. If any is found, a `WARNING: Dummy imports detected.` message is printed.
5. **Saving Results:** Exports the processed data to `excel_name.xlsx` if enabled, with one sheet per selected output and a `check_dummies` sheet when dummy activity is detected.

## Usage

Run the postprocessing script using:

```bash
python database_postprocessing.py
```

## Troubleshooting

- **Database Connection Errors:** Ensure the `.sqlite` files listed in `file` exist; relative paths are resolved from the folder the script is run from.
- **No Scenarios Found:** Ensure the database has been solved with TEMOA, so that `output_objective` contains at least one scenario.
- **No Data Found:** Ensure `tech_list`, the commodity lists, and `regions_list` are correctly specified, and that the corresponding outputs are set to `True` in `result_set`.
- **Dummy Imports Detected:** The model is using dummy/backstop technologies to meet some demand or constraint; check the `check_dummies` sheet.
- **Missing Data:** Verify that input tables contain complete data.
- **Performance Issues:** Adjust `processes` for parallel execution efficiency.

## Contact

For further assistance, reach out to Matteo Nicoli at [matteo.nicoli@polito.it](mailto:matteo.nicoli@polito.it).
