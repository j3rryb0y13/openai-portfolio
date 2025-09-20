[í³˜ Systematic Thinking Guide](../docs/Systematic_Thinking_Guide.md)

---

#Week 2 - SQL Retail Analysis

This folder contains SQL queries and outputs for **Week 2** of my OpenAI Portfolio & Learning Plan.
The focus this week is analyzing **markdowns (A/B/C/D)** and preparing core retail metrics for portfolio-ready analysis.


---

## Structure
- 'queries/' - saved '.sql' queries
- 'outputs/' - exported results (CSV)
- 'README.MD' - documentation for this week

## Queries
1. **01_markdown_rollup_sql**
    - Total markdown dollars by 'markdown_type' (A/B/C/D)
    - Helps visualize where markdowns spend in concentrated.
    - Output saved to: 'outputs/01_markdown_rollup.csv'

2. **02_weekly_trends.sql** 
    - Totals markdowns by 'week day' + 'markdown_type'
    - Shows markdown trends over time.

3. **03_department_breakout.sql**
    - Breaks markdows down by 'department' + 'markdown_type'
    - Useful for identify which categories drive markdowns

4. **04_opportunity_list.sql**
    - Advanced query: highlights high-oos, high-demand items (from sales + oos tables)
    - Bridges markdown analysis with operational opportunities


---

## Notes
- Data source: 'markdown_data.sqlite
- Environment: SQLite in VS Code
- Queries run with hotkey **CTRL + Enter** (Custom Mapped)

## Net Steps
- Build out '02_weekly_trends.sql' and export results
- Expand into '03_department_breakdown.sql'
- Write developer journal entry summarizing 'Week 2' learnings.