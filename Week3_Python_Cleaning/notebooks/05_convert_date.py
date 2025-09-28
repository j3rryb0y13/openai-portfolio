import pandas as pd

df = pd.read_csv("../../Week2_SQL_Retail/outputs/markdowns.csv")

df["week_date"] = pd.to_datetime(df["week_date"])

print("\n=== DATE CONVERTED ===")
print(df.info())
