# Database Creator, Preprocessing, and Postprocessing Algorithms - User Guide

## Introduction

This guide provides comprehensive instructions for using the Database Creator, Preprocessing, and Postprocessing Python algorithms. The **Creator** and **Preprocessing** scripts are necessary to prepare the SQLite database in a TEMOA-compliant format starting from the provided SQL text, while the **Postprocessing** script can be used to postprocess results.

## Prerequisites

Ensure you have the **temoa virtual environment** installed and activated in the console to guarantee compatibility with all dependencies.

# Database Creator

## Overview

The `database_creator.py` script automates the process of creating, preprocessing, and optionally simplifying an SQLite database for the TEMOA-Italy project. The script executes in four primary steps controlled by Boolean flags:

1. **Deleting:** Removes an existing database if present.
2. **Reading:** Creates a new database by executing SQL scripts.
3. **Preprocessing:** Runs a Python preprocessing script.
4. **Simplifying (Optional):** Simplifies the database structure if enabled.

## Key Components

- **SQLite Database File:** `TEMOA_Italy.sqlite`
- **SQL Script(s):** `TEMOA_Italy.sql`
- **Preprocessing Script:** `database_preprocessing.py`
- **Simplification Script (Optional):** `database_simplifier.sql`

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

### 3. Preprocessing the Database
- **Controlled by:** `Preprocessing = True`
- **Functionality:**
  - Executes the `database_preprocessing.py` script to manipulate the database.
  - Involves cleaning data, optimizing performance, or adding derived metrics.

### 4. Simplifying the Database (Optional)
- **Controlled by:** `Simplifying = False` *(set to `True` to enable)*
- **Functionality:**
  - Executes the `database_simplifier.sql` script.
  - Removes unnecessary data, such as outdated milestone years.

### 5. Final Optimization
- **Command:** `VACUUM`
- **Purpose:**
  - Rebuilds the SQLite database to defragment the file and optimize storage.
  - Reduces file size and improves performance after data manipulations.

## Modifying the Script

- **Skip Deletion:** Set `Deleting = False` to retain the existing database.
- **Bypass SQL Execution:** Set `Reading = False` if no schema updates are needed.
- **Disable Preprocessing:** Set `Preprocessing = False` if preprocessing is unnecessary.
- **Enable Simplification:** Set `Simplifying = True` to reduce the database size.

## Usage

Run the creator script using:

```bash
python database_creator.py
```

# Database Preprocessing

## Setup Instructions

1. Place your SQLite database files in the working directory.
2. Adjust the input parameters in the preprocessing script:
   - `lifetime_default`: Default lifetime value for technologies.
   - `print_status`: Set to `True` to enable console output.
   - `print_outcome`: Enables/disables console output for specific datasets.
   - `save_tosql`: Controls whether processed data is saved to the database.

## Model Inputs

The script preprocesses and saves the following model input tables:

- `EmissionActivity`
- `EmissionLimit`
- `LifetimeProcess`
- `Efficiency`
- `TechInputSplit`
- `TechOutputSplit`
- `Currency`
- `CostInvest`
- `CostFixed`
- `CostVariable`
- `DiscountRate`
- `MinCapacity`
- `MinActivity`
- `MaxCapacity`
- `MaxActivity`
- `MinInputGroup`
- `MaxInputGroup`
- `MinOutputGroup`
- `MaxOutputGroup`
- `MinActivityGroup`
- `MaxActivityGroup`
- `MinCapacityGroup`
- `MaxCapacityGroup`
- `Demand`
- `CapacityFactor`
- `CapacityFactorProcess`
- `CapacityCredit`
- `EnergyCommodityConcentrationIndex`
- `TechnologyMaterialSupplyRisk`
- `MaterialIntensity`

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

Run the preprocessing script using:

```bash
python database_preprocessing.py
```

# Database Postprocessing

## Setup Instructions

1. Place your SQLite database files in the working directory.
2. Adjust the input parameters in the postprocessing script:
   - `processes`: Number of parallel processes (e.g., `1` for single-threaded).
   - `print_set`: Set to `True` to enable console output.
   - `toexcel_set`: Set to `True` to export results to Excel.
   - `excel_name`: Define the output Excel file name.
   - `file`: List of database file paths.

## Available Outputs

The script can postprocess the following outputs:

- `Output_CapacityByPeriodAndTech`
- `Output_V_Capacity`
- `Output_CostInvest`
- `Output_CostFixed`
- `Output_CostVariable`
- `Output_VFlow_In`
- `Output_VFlow_Out`
- `Output_VMat_Cons`
- `Output_Emissions`

## Input Parameters

- **Filtering Criteria:**
  - **General Criteria:** `regions_list`
    - *Note:* If `periods_list` is not provided, the script will automatically extract the list of `time_optimize` periods from the TEMOA database and use all of them. Each output is provided by periods.
    - *Note:* If `regions_list` includes "global", the sum of outputs across all the spatial regions is provided.
    - *Note:* At least one region and one entry between `tech_list` and the different commodities lists must not be empty in order to see results. Otherwise, a warning will be printed.
  - **Output-Specific Criteria:**
    - `Output_CapacityByPeriodAndTech`: `regions_list`, `tech_list`
    - `Output_V_Capacity`: `regions_list`, `tech_list`
    - `Output_CostInvest`: `regions_list`, `tech_list`
    - `Output_CostFixed`: `regions_list`, `tech_list`
    - `Output_CostVariable`: `regions_list`, `tech_list`
    - `Output_VFlow_In`: `regions_list`, `tech_list`, `input_comm_list`
    - `Output_VFlow_Out`: `regions_list`, `tech_list`, `output_comm_list`
    - `Output_VMat_Cons`: `regions_list`, `tech_list`, `material_comm_list`
    - `Output_Emissions`: `regions_list`, `tech_list`, `emissions_comm_list`

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

For further assistance, reach out to the script author or maintainer.

