# 07_plot_pct.py
# Quick visual: histogram of percent markdowns + simple grounded summary.

import pandas as pd 
import matplotlib.pyplot as plt

# load the latest CSV you've been working with
df = pd.read_csv("../../Week2_SQL_Retail/outputs/markdowns.csv")

# (if you dind't rename in this file, map the original names brieflt)
df = df.rename(columns={
  "week_date": "date",
  "markdown_type": "md_type",
  "markdown_dollars": "markdowns",
  "sales_dollars": "sales",
  "store_region":"region"
})

# convert date to datetime (safe if already ok)

df["date"] = pd.to_datetime(df["date"], errors="coerce")

# create % markdown (0-100)
df["pct_markdown"] = (df["markdowns"]/ df["sales"]) * 100

print("\n=== SUMMARY ===")
print("Mean % markdown:", round(df["pct_markdown"].mean(), 2))
print("By markdown type (mean%):")
print(df.groupby("md_type")["pct_markdown"].mean().round(2))

# 1) Hisstgram of % markdown
plt.figure()
df["pct_markdown"].plot(kind="hist", bins=20)
plt.title("Disstribution of% Markdown")
plt.xlabel("% markdown")
plt.ylabel("Frequency")
plt.tight_layout()
plt.show()

# 2) (Opitional) Bar chart of mean % by md_type
plt.figure()
df.groupby("md_type")["pct_markdown"].mean().plot(kind="bar")
plt.title("Mean % Markdown by Type")
plt.xlabel("markdown type")
plt.ylabel("mean % markdown")
plt.tight_layout()
plt.show()

