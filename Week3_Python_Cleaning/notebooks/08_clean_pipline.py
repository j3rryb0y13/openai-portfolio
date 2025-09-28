# clean_pipline.py
# End-to-end: load raw CSV -> clean -> export clean CSV to Week3 outputs  

from pathlib import Path 
import pandas as pd

# ------ Paths -------
FILE_DIR = Path(__file__).resolve().parent               # ../Week3_Python_Cleaning/Notebooks
REPO_ROOT = FILE_DIR.parents[1]                         # .../openai-portfolio
RAW_CSV = REPO_ROOT / "Week2_SQL_Retail" / "outputs" / "markdowns.csv"
OUT_DIR = REPO_ROOT / "Week3_Python_Cleaning" / "outputs"
OUT_CSV = OUT_DIR / "markdown_clean.csv"

print("Using raw CSV:", RAW_CSV)
OUT_DIR.mkdir(parents=True, exist_ok=True)

# ------ Load ------
df = pd.read_csv(RAW_CSV)
print("\n=== RAW SHAPE ===",df.shape)

# ------Rename ------
df = df.rename(columns={
  "week_date": "date",
  "markdown_type": "md_type",
  "markdown_dollars": "markdowns",
  "sales_dollars": "sales",
  "store_region": "region"
})

# ------Types ------
df["date"] = pd.to_datetime(df["date"], errors="coerce")

# ------Basic Cleaning-------
# Drop exact duplicate rows
before = len(df)
df = df.drop_duplicates()
print(f"Dropped duplicates: {before - len(df)}")


# Null Overview
print("\n=== NULLS BEFORE FILLS ===")
print(df.isna().sum())

# Simple fills (beginner-friendly; adjust later as needed)
num_cols = df.select_dtypes(include="number").columns
obj_cols = df.select_dtypes(include="object").columns
df[num_cols] = df[num_cols].fillna(0)
df[obj_cols] = df[obj_cols].fillna("unknown")

# ------- Calculated columns -------
# Percent markdown (safe divide)
df["pct_markdown"] = (df["markdowns"] / df["sales"]).where(df["sales"]!= 0,0) * 100


# ------- Validate ---------
print("\n=== CLEAN SHAPE ====", df.shape)
print("\n=== DTYPES ===")
print(df.dtypes)
print("\n=== NULLS AFTER FILL ===")
print(df.isna().sum())
print("\n=== DESCRIBE (numeric) ====")
print(df.describe())


# ------ EXPORT -------
df.to_csv(OUT_CSV, index=False)
print("\nSaved cleaned CSV to:", OUT_CSV)
