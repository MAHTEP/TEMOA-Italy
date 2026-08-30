import os
import sqlite3

sqlite_database = 'TEMOA_Italy.sqlite'
sql_modules = ['TEMOA_Italy.sql']

Deleting = True
Reading = True
Preprocessing = True
Simplifying = False

kept_years = [2007, 2010, 2020, 2030, 2040, 2050, 2060]


# -----------------------------------------------------------------------------
# Check if the SQLite database already exists and delete it
# -----------------------------------------------------------------------------

if Deleting:
    if os.path.exists(sqlite_database):
        os.remove(sqlite_database)
        print("{:>62}".format('Existing SQLite database deleted.'))


# -----------------------------------------------------------------------------
# Create the SQLite database and execute the SQL code(s)
# -----------------------------------------------------------------------------

if Reading:
    for sql in sql_modules:
        conn = sqlite3.connect(sqlite_database)
        with open(sql, mode='r', encoding='utf-8-sig') as sql_code:
            conn.executescript(sql_code.read())
        conn.commit()
        conn.close()
    print("{:>62}".format('SQLite database created and SQL code executed.'))


# -----------------------------------------------------------------------------
# Execute the database_preprocessing.py script
# -----------------------------------------------------------------------------

if Preprocessing:
    from database_preprocessing import preprocess_database
    preprocess_database(sqlite_database)
    print("{:>62}".format('SQLite database preprocessed.'))


# -----------------------------------------------------------------------------
# Simplify the SQLite database
# -----------------------------------------------------------------------------

def format_sql_list(values):
    """Convert a Python list into a SQL-compatible tuple string."""
    return '(' + ', '.join(str(v) for v in values) + ')'

if Simplifying:

    conn = sqlite3.connect(sqlite_database)
    cursor = conn.cursor()

    years_sql = format_sql_list(kept_years)

    # Tables containing a "periods" column
    period_tables = [
        'capacity_credit',
        'cost_fixed',
        'cost_variable',
        'cost_emission',
        'demand',
        'demand_specific_distribution',
        'driver',
        'elasticity',
        'limit_emission',
        'limit_activity',
        'limit_activity_share',
        'limit_capacity',
        'limit_capacity_share',
        'lifetime_survival_curve',
        'limit_tech_input_split',
        'limit_tech_input_split_annual',
        'limit_tech_output_split',
        'limit_tech_output_split_annual'
    ]

    # Tables containing a "vintage" column
    vintage_tables = [
        'capacity_credit',
        'capacity_factor_process',
        'construction_input',
        'cost_emission',
        'cost_invest',
        'cost_fixed',
        'cost_variable',
        'efficiency',
        'efficiency_variable',
        'emission_activity',
        'emission_embodied',
        'emission_end_of_life',
        'end_of_life_output',
        'existing_capacity',
        'lifetime_process',
        'lifetime_survival_curve',
        'limit_annual_capacity_factor',
        'limit_new_capacity',
        'limit_new_capacity_share',
        'loan_lifetime_process',
        'loan_rate',
        'myopic_efficiency',
        'reserve_capacity_derate'
    ]

    # Delete rows whose periods are NOT in kept_periods
    for table in period_tables:
        query = f'''
            DELETE FROM "{table}"
            WHERE "period" NOT IN {years_sql}
        '''
        cursor.execute(query)

    # Delete rows whose vintages are NOT in kept_vintages
    for table in vintage_tables:
        query = f'''
            DELETE FROM "{table}"
            WHERE "vintage" NOT IN {years_sql}
        '''
        cursor.execute(query)

    # Simplify time_periods table
    cursor.execute(f'''
        DELETE FROM "time_period"
        WHERE "period" NOT IN {years_sql} AND "flag" <> 'e'
    ''')

    conn.commit()
    conn.close()

    print("{:>62}".format('SQLite database simplified.'))


# -----------------------------------------------------------------------------
# Vacuum database
# -----------------------------------------------------------------------------

conn = sqlite3.connect(sqlite_database)
conn.execute("VACUUM")
conn.close()