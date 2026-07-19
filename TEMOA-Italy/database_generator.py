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
        'CapacityCredit',
        'CostFixed',
        'CostVariable',
        'CostEmission',
        'Demand',
        'Driver',
        'Elasticity',
        'EmissionLimit',
        'EnergyCommodityConcentrationIndex',
        'MaxActivity',
        'MaxActivityGroup',
        'MaxCapacity',
        'MaxCapacityGroup',
        'MaxInputGroup',
        'MaxOutputGroup',
        'MinActivity',
        'MinActivityGroup',
        'MinCapacity',
        'MinCapacityGroup',
        'MinInputGroup',
        'MinOutputGroup',
        'TechInputSplit',
        'TechOutputSplit'
    ]

    # Tables containing a "vintage" column
    vintage_tables = [
        'CapacityCredit',
        'CapacityFactor',
        'CapacityFactorProcess',
        'CostFixed',
        'CostInvest',
        'CostVariable',
        'DiscountRate',
        'Efficiency',
        'EmissionActivity',
        'ExistingCapacity',
        'LifetimeProcess',
        'MaterialIntensity',
        'TechnologyMaterialSupplyRisk'
    ]

    # Delete rows whose periods are NOT in kept_periods
    for table in period_tables:
        query = f'''
            DELETE FROM "{table}"
            WHERE "periods" NOT IN {years_sql}
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
        DELETE FROM "time_periods"
        WHERE "t_periods" NOT IN {years_sql} AND "flag" <> 'e'
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