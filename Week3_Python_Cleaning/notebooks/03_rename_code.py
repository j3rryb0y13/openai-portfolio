import pandas as pd 

df = pd.read_csv("../../Week2_SQL_Retail/outputs/markdowns.csv")

#rename columns
df = df.rename(columns= {
  "week_date":"date",
  "markdown_type": "md_type",
  "markdown_dollars": "markdowns",
  "sales_dollars": "sales",
  "store_region": "region"
})

print ("\n=== RENAMED COLUMNS ===")
print (df.head())

