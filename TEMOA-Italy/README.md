# Database Generator, Preprocessing, and Postprocessing Algorithms - User Guide

## Introduction

This guide provides comprehensive instructions for using the Database Generator, Preprocessing, and Postprocessing Python algorithms. The **Generator** and **Preprocessing** scripts are necessary to prepare the SQLite database in a TEMOA-compliant format starting from the provided SQL text, while the **Postprocessing** script can be used to postprocess results.

## Prerequisites

Ensure you have the **temoa virtual environment** installed and activated in the console to guarantee compatibility with all dependencies.

## Repository Content

The GitHub repository includes several SQL codes, together with their associated SQLite databases and results. Each model is generated, preprocessed, and postprocessed with the same algorithms described in this guide, simply by pointing the scripts to the corresponding `.sql` and `.sqlite` file names.

### Full model

- **TEMOA_Italy** is the full multi-sectorial model, representing all the sectors of the Italian energy system. It adopts a single spatial region and a time horizon from 2006 to 2050.

### Sectoral models

- **Commercial_Agriculture, Hydrogen_Sequestration, Industry, Residential, Transport** sectoral codes include the same data as the corresponding sectors of TEMOA_Italy. They are intended to be used for **testing model changes** and do not produce significative results, since they do not represent, for instance, prices and constraints related to the input commodities of such sectors. They also adopt a single spatial region and a time horizon from 2006 to 2050.
- **Power** includes the same data as the TEMOA-Italy power sector, integrated with a simplified modeling of the prices of the input commodities. It can therefore be used as a **stand-alone model** of the Italian power sector only, implemented on a single spatial region and a time horizon from 2006 to 2050.

### Multi-regional models

- **Power_20R** and **Power_Hydrogen_20R** are multi-regional implementations of the power sector and of the power and hydrogen sectors, respectively. They adopt **20 spatial regions**, corresponding to the 20 Italian administrative regions, and a time horizon from 2022 to 2050.

# Database Generator

## Overview

The `database_generator.py` script automates the process of generating, preprocessing, and optionally simplifying an SQLite database for the TEMOA-Italy project. The script executes in four primary steps controlled by Boolean flags:

1. **Deleting:** Removes an existing database if present.
2. **Reading:** Creates a new database by executing SQL scripts.
3. **Preprocessing:** Runs a Python preprocessing script.
4. **Simplifying (Optional):** Simplifies the database structure if enabled.

## Key Components

- **SQLite Database File:** e.g. `TEMOA_Italy.sqlite`
- **SQL Script(s):** e.g. `TEMOA_Italy.sql`, listed in `sql_modules` (several SQL files can be executed in sequence on the same database).

*Note* The same components apply to the other models available in the repository (e.g. `Power.sql`/`Power.sqlite`, `Power_20R.sql`/`Power_20R.sqlite`), it is sufficient to update the database and SQL script names in the script.
- **Preprocessing Script:** `database_preprocessing.py`, imported as `from database_preprocessing import preprocess_database` and invoked as `preprocess_database(sqlite_database)`.

## Step-by-Step Breakdown

### 1. Deleting the Existing Database
- **Controlled by:** `Deleting = True`
- **Functionality:**
  - Checks if the database file (`TEMOA_Italy.sqlite`) exists.
  - Deletes the file to ensure a clean slate for database creation.

### 2. Reading and Creating the Database
- **Controlled by:** `Reading = True`
- **Functionality:**
  - Iterates over the `sql_modules` list (e.g., `TEMOA_Italy.sql`).
  - Connects to the SQLite database (creates it if it doesn't exist).
  - Executes the SQL script to define tables, relationships, and insert data.
  - SQL files are read with `utf-8-sig` encoding, so a leading BOM is handled transparently.

### 3. Preprocessing the Database
- **Controlled by:** `Preprocessing = True`
- **Functionality:**
  - Calls `preprocess_database()` from `database_preprocessing.py` to manipulate the database.
  - Involves interpolating and extrapolating sparse time series, deriving emission factors, converting currencies, and projecting demand.

### 4. Simplifying the Database (Optional)
- **Controlled by:** `Simplifying = False` *(set to `True` to enable)*
- **Functionality:**
  - Simplifies the model time horizon by reducing the number of future time periods and keeping active only those listed in the `kept_years` list.

### 5. Final Optimization
- **Command:** `VACUUM`
- **Purpose:**
  - Rebuilds the SQLite database to defragment the file and optimize storage.
  - Reduces file size and improves performance after data manipulations.
  - Executed unconditionally, at the end of the script.

## Modifying the Script

- **Skip Deletion:** Set `Deleting = False` to retain the existing database.
- **Bypass SQL Execution:** Set `Reading = False` if no schema updates are needed.
- **Disable Preprocessing:** Set `Preprocessing = False` if preprocessing is unnecessary.
- **Enable Simplification:** Set `Simplifying = True` to reduce the number of future time periods (optional), and edit `kept_years` accordingly.

## Usage

Run the creator script using:

```bash
python database_generator.py
```

# Database Preprocessing

## Overview

`database_preprocessing.py` exposes a single entry point, `preprocess_database(sqlite_database)`, which preprocesses a TEMOA database **in place**. Foreign keys are disabled for the duration of the run (`PRAGMA foreign_keys = OFF`), and each processed table is rewritten with a `DELETE` + `INSERT` rather than being dropped and recreated, so primary keys and foreign key constraints defined in the SQL code are preserved.

## Setup Instructions

1. Place your SQLite database files in the working directory.
2. Adjust the input parameters in the preprocessing script:
   - `lifetime_default`: Default lifetime value for technologies (40 years).
   - `print_status`: Set to `True` to enable console output (one timed status line per section).
   - `print_outcome`: A dictionary keyed on the processed tables; set an entry to `True` to print the resulting DataFrame of that section for debugging.
   - `save_tosql`: A dictionary with the same keys, controlling whether the processed data of each section is written back to the database. By default every section is saved.

## Model Inputs

The script preprocesses and saves the following tables, in this order:

- `emission_activity`
- `limit_emission`
- `lifetime_process`
- `efficiency`
- `limit_tech_input_split`
- `limit_tech_input_split_annual`
- `limit_tech_output_split`
- `limit_tech_output_split_annual`
- `currency`
- `cost_invest`
- `cost_fixed`
- `cost_variable`
- `cost_emission`
- `loan_rate`
- `limit_capacity`
- `limit_activity`
- `demand`
- `capacity_factor_process`
- `capacity_credit`
- `construction_input`

### Extension tables

Seven tables are part of the schema but are not used by every model: `commodity_emission_factor`, `emission_aggregation`, `currency`, `currency_tech`, `allocation`, `driver`, `elasticity`. They drive three optional steps:

- computation of `emission_activity` from `commodity_emission_factor` and `emission_aggregation`;
- cost-currency conversion for `cost_invest`, `cost_fixed`, and `cost_variable`;
- demand projection from a base-year value via driver growth × elasticity.

Each step is guarded by a check on whether the corresponding table is populated, so the script degrades gracefully: if an extension table is missing or empty, the script falls back to plain interpolation/extrapolation of the values already stored in the tables.

## Processing Steps

1. **Data Extraction:** Loads tables from the SQLite database.
2. **Calculation & Interpolation:** Performs linear interpolation and extrapolation for time series data.
3. **Merging & Aggregation:** Combines data from different tables and applies aggregation rules.
4. **Specific Preprocessing for Key Tables:**
   - **EmissionActivity:** Calculated by merging pre-existing emission factors with commodity emission factors, considering efficiency data.
   - **Currency:** Adjusts cost-related data to a common reference currency by applying conversion rates.
   - **Demand:** Demand values are processed through interpolation, extrapolation, and adjusted based on historical trends.
5. **Saving Results:** Saves the processed data back to the SQLite database if enabled.

## Usage

The preprocessing script is executed by the generator script, or it can be run using:

```bash
python database_preprocessing.py
```

# Database Postprocessing

## Setup Instructions

1. Place your SQLite database files in the working directory.
2. Adjust the input parameters in the postprocessing script:
   - `processes`: Number of parallel processes (e.g., `1` for single-threaded). Work is distributed over (database, scenario) pairs.
   - `print_set`: Set to `True` to enable console output.
   - `toexcel_set`: Set to `True` to export results to Excel.
   - `excel_name`: Define the output Excel file name (without extension).
   - `file`: List of database file paths. Scenarios are detected automatically by reading the `output_objective` table of each database.
   - `result_set`: Dictionary of Boolean flags selecting which outputs are postprocessed. Only the outputs set to `True` are computed, printed, and exported.

## Available Outputs

The script can postprocess the following outputs:

- `output_net_capacity`
- `output_built_capacity`
- `output_retired_capacity`
- `output_cost`
- `output_flow_in`
- `output_flow_out`
- `output_emission`

## Input Parameters

- **Filtering Criteria:**
  - **General Criteria:** `regions_list`
    - *Note:* If `periods_list` is not provided, the script will automatically extract the list of `time_optimize` periods from the TEMOA database and use all of them. Each output is provided by periods.
    - *Note:* If `regions_list` includes "global", the sum of outputs across all the spatial regions is provided.
    - *Note:* At least one region and one entry between `tech_list` and the different commodities lists must not be empty in order to see results. Otherwise, a warning will be printed.
  - **Output-Specific Criteria:**
    - `output_net_capacity`: `regions_list`, `tech_list`
    - `output_built_capacity`: `regions_list`, `tech_list`
    - `output_retired_capacity`: `regions_list`, `tech_list`
    - `output_cost_invest`: `regions_list`, `tech_list`
    - `output_cost_fixed`: `regions_list`, `tech_list`
    - `output_cost_variable`: `regions_list`, `tech_list`
    - `output_flow_in`: `regions_list`, `tech_list`, `input_comm_list`
    - `output_flow_out`: `regions_list`, `tech_list`, `output_comm_list`
    - `output_construction_input`: `regions_list`, `tech_list`, `material_comm_list`
    - `output_emission`: `regions_list`, `tech_list`, `emissions_comm_list`

- **Disaggregation Options:**
  - `disaggregation`: Configure data aggregation levels by regions, technologies, etc.
    - *Note:* Disaggregation by databases and scenarios is automatic if more than one is detected within the databases.

## Processing Steps

1. **Data Extraction:** Loads tables from the SQLite database.
2. **Calculation & Interpolation:** Performs linear interpolation and extrapolation for time series data.
3. **Merging & Aggregation:** Combines data from different tables and applies aggregation rules.
4. **Saving Results:** Exports the processed data to Excel if enabled.

## Usage

Run the postprocessing script using:

```bash
python database_postprocessing.py
```

## Troubleshooting

- **Database Connection Errors:** Ensure the `.sqlite` file exists in the working directory.
- **No Data Found:** Ensure `tech_list` and `regions_list` are correctly specified.
- **Missing Data:** Verify that input tables contain complete data.
- **Performance Issues:** Adjust `processes` for parallel execution efficiency.

## Contact

For further assistance, reach out Matteo Nicoli at [matteo.nicoli@polito.it](mailto:matteo.nicoli@polito.it).
