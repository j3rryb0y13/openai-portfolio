-- Practice Drills for Week 2


-- ===================================
-- Drill 1: Filter Rows
-- Purpose: Show only rows where markdown_type = 'A'
-- What it teaches:
--   *Using WHERE to filter data
--   *LIMIT to control how many rows display
-- Expectation:
--   * 10 rows, all with the markdown_type = 'A'

-- ===================================


SELECT *
FROM markdowns
WHERE markdown_type IN ('A', 'B')
LIMIT 20;


-- ===================================
-- Drill 2: Sum with condition
-- Purpose: Get the total markdown dollars for type A
-- What it teaches: 
--    * SUM() to aggregate values
--    * ROUND() to format results
--    * WHERE to restirct which rows get summed
-- Expectation:
-- * A single number,the total markdown dollars for type A

-- ===================================

SELECT ROUND(SUM(markdown_dollars), 2) AS total_A
FROM markdowns
WHERE markdown_type = 'A';


-- ===================================

-- Drill 3: Group by two columns
-- Purpose: Show markdown totals by department + type
-- What it teaches:
--    *GROUP BY more than one column
--    *ORDER BY to sort results
-- Expectation:
--    *A List of departments, each with A/B/C/D totals
--    *Sorted so biggest totalls show first inside each departmen

-- ===================================


SELECT
  department,
  markdown_type,
  ROUND(SUM(markdown_dollars), 2) AS total
  FROM markdowns
  GROUP BY department, markdown_type
  ORDER BY department, total DESC;


-- ===================================


-- Drill 4: Weekly Totals
-- Purpose: Show total markdown dollars by week
-- What it teache:
--    * GROUP BY a date field
--    * ORDER BY to follow the timeline
-- Expectation:
--    * One row per week_date with total markdowns
--    * Sorted in chronological order

-- ===================================


SELECT
  week_date,
  ROUND(SUM(markdown_dollars), 2) AS total_markdowns
FROM markdowns
GROUP BY week_date
ORDER BY week_date;

-- ===================================

-- Drill 5: Markdown Rate %
-- Purpose: Calculate markdown as % of sales dollars, by department
-- What it teaches:
--    * Creating a calculated metric with SUM()
--    * Divisiono in SQL
--    * Using Round() to format percentages 
-- Expectations:
--    * One row per department
--    * Column showing markdown $ and % of sales $

-- ===================================

SELECT
  department,
  ROUND(SUM(markdown_dollars) * 1.0 / SUM (sales_dollars) * 100, 2) AS markdown_rate_pct
FROM markdowns
GROUP BY department
ORDER BY markdown_rate_pct DESC;

-- ===================================

-- Drill 6: Top 5 weeks with highest markdowns
-- Purpose: Rank by weeks by total markdown dollars and show the top 5
-- What it teaches:
--    * GROUP BY + SUM to aggeragte per week
--    * ORDER BY total DESC to rank
--    * LIMIT to keep only the top N
-- Expectation:
--    * 5 rows: the biggest weeks by markdown spend
-- ===================================

SELECT
  week_date,
  ROUND(SUM(markdown_dollars), 2) AS total_markdowns
FROM markdowns
WHERE week_date BETWEEN '2024-06-01' AND '2024-08-31'
GROUP BY week_date
ORDER BY total_markdowns DESC
LIMIT 10;

-- ===================================

-- Drill 7: Department with largest markdowns in East regioin
-- Purpose: Identify the department driving markdowns within a region
-- What it teaches:
--    * Filtering rows by region (WHERE)
--    * Aggregating totals by department
--    * Sorting and using LIMIT to find the top one
-- Expectation:
--    * One row: the department with the biggest markdown total in "East"

-- ===================================

SELECT
  department,
  ROUND(SUM(markdown_dollars), 2) AS total_markdowns
FROM markdowns
WHERE store_region = 'East'
GROUP BY department
ORDER BY total_markdowns DESC
LIMIT 1;

-- ===================================

-- Drill 8: Compare salles vs markdowns by week
-- Purpose: View weekly totals for both sales and markdowns
-- What it teaches: 
--    * Summarizing multiple metrics in the same query
--    * Reading trends across two measures
-- Expectations:
--    * One row per week_date
--    * Two columns: total_sales and total_markdowns

-- ===================================

SELECT
  week_date,
  ROUND(SUM(sales_dollars), 2) AS total_sales,
  ROUND(SUM(markdown_dollars), 2) AS total_markdowns
FROM markdowns
GROUP BY week_date
ORDER BY week_date;

-- ===================================

-- Drill 9: Department with > 10% markdown rate
-- Purpose: Flag departments where markdowns are unusually high 
-- What it teachs:
--    * HAVING clause to filter after aggregation
--    * Combining aggregate functions with conditions
-- Expectations: 
--    * Only departments with markdown > 10%


SELECT
  department,
  ROUND(SUM(markdown_dollars) * 1.0 / SUM(sales_dollars) * 100, 2) AS markdown_rate_pct
FROM markdowns
GROUP BY department
HAVING markdown_rate_pct > 10
ORDER BY markdown_rate_pct DESC;

-- ===================================

-- Drill 10: Region x Type Breakdown
-- Purpose: See markdown mix by region and type
-- What it teaches:
--    * GROUP BY with two catergorical fields
--    * ORDER BY multiple columns 
-- Expectation: 
--    * Rows groped by region and markdown type
--    * Largest totals listed first inside each region

-- ===================================

SELECT
  department,
  ROUND(SUM(markdown_dollars), 2) AS total_markdowns
FROM markdowns
GROUP BY department
ORDER BY total_markdowns DESC
LIMIT 1;

-- ===================================
