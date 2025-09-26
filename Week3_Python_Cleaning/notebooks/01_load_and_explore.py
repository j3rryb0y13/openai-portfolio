# 01_load_and_explore.py
# Week 3 starter: load CSV and inspect

import pandas as pd #import pandas (pd is jsut the nickname)

#load the Week 2 markdowns csv
df = pd.read_csv("../Week2_SQL_Retail/outputs/markdowns.csv")

# show first 5 rows
print("\n=== HEAD ===")
print(df.head())

# show structure: rows, columns, datatypes, null counts
print("\n=== INFO ===")
df.info()

# show quick stats for numeric columns
print("\n=== DESCRIBE ===")
print(df.describe())



