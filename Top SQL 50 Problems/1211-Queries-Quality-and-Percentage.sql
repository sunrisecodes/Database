select
    query_name,
    ROUND((sum(rating /position ) /count(query_name)), 2) as quality,
    ROUND((SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END) / COUNT(query_name)) * 100, 2) AS poor_query_percentage 
from Queries
group by query_name