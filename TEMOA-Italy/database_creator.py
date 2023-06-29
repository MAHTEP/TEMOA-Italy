import os
import sqlite3

sqlite_database = 'TEMOA_Italy.sqlite'
sql_modules = ['TEMOA_Italy.sql']

Deleting = True
Reading = True
Preprocessing = True
Simplifying = True

# Check if the SQLite database already exists and delete it

if Deleting:
    if os.path.exists(sqlite_database):
        os.remove(sqlite_database)
        print("{:>62}".format('Existing SQLite database deleted.'))

# Create the SQLite database and execute the SQL code(s)

if Reading:
    for sql in sql_modules:
        conn = sqlite3.connect(sqlite_database)
        with open(sql, mode='r', encoding='utf-8-sig') as sql_code:
            conn.executescript(sql_code.read())
        conn.commit()
        conn.close()
    print("{:>62}".format('SQLite database created and SQL code executed.'))

# Execute the database_preprocessing.py script

if Preprocessing:
    with open("database_preprocessing.py") as preprocessing:
        exec(preprocessing.read())
    print("{:>62}".format('SQLite database preprocessed.'))

# Simplify the SQLite database by removing the selected set of milestone years

if Simplifying:
    conn = sqlite3.connect(sqlite_database)
    with open('database_simplifier.sql', mode='r', encoding='utf-8-sig') as sql_code:
        conn.executescript(sql_code.read())
    conn.commit()
    conn.close()
    print("{:>62}".format('SQLite database simplified.'))