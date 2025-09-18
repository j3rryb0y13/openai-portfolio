-- Weekly markdown trends by week and type
SELECT
  week_date,
  markdown_type,
  ROUND(sum(markdown_dollars), 2) AS total_markdown
From markdowns
GROUP BY week_date, markdown_type
ORDER BY week_date, total_markdown DESC;
