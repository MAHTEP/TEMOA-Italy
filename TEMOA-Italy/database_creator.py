import sqlite3

conn = sqlite3.connect('TEMOA_Italy.sqlite')
with open('TEMOA_Italy.sql', 'r') as sql_file:
    conn.executescript(sql_file.read())
conn.close()

print('\nSQLite database created and filled according to the SQL code.\n')

with open("database_preprocessing.py") as preprocessing:
    exec(preprocessing.read())