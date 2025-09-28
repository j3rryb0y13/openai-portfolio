import pandas as pd

df = pd.read_csv("../../Week2_SQL_Retail/outputs/markdowns.csv")

#create a new calculate column
df["pct_markdown"] = df["markdown_dollars"] / df["sales_dollars"] *100 

print("\n=== WITH NEW COLUMN ===")  
print(df.head())

