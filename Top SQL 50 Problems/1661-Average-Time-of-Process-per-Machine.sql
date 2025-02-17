SELECT
    machine_id,
    ROUND(
        (SUM( CASE WHEN activity_type = 'end' then timestamp END)-
        SUM( CASE WHEN activity_type = 'start' then timestamp END)) 
        / count(distinct process_id) ,3
    ) As processing_time 
FROM Activity 
GROUP BY machine_id 
