-- SQLite
select markdown_type,
  round(sum(markdown_dollars), 2) as total_markdown
from markdowns
group by markdown_type
order by total_markdown desc;
