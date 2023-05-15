import os
import sqlite3

database_name = 'TEMOA_Italy.sqlite'

# Check if the SQLite database already exists and delete it

if os.path.exists(database_name):
    os.remove(database_name)
    print('\nExisting SQLite database deleted.')

# Create the SQLite database and execute the SQL code(s)

conn = sqlite3.connect(database_name)
with open('TEMOA_Italy.sql', 'r') as sql_file:
    conn.executescript(sql_file.read())
conn.commit()
conn.close()

print('\nSQLite database created and SQL code executed.\n')

# Execute the database_preprocessing.py script

with open("database_preprocessing.py") as preprocessing:
    exec(preprocessing.read())

print('\nSQLite database preprocessed.\n')