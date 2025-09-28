import pandas as pd 

df = pd.read_csv("../../Week2_SQL_Retail/outputs/markdowns.csv")

print("\n=== NULL CHECK ===")
print(df.isna().sum())

print("\n=== DUPLICATE CHECK ===")
print(df.duplicated().sum())




