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
--    *Sorted so biggest totalls show first inside each department


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
