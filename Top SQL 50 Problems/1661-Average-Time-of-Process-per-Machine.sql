SELECT
   x.machine_id,
   round(avg(y.timestamp - x.timestamp ),3 ) as processing_time 
from Activity x
JOIN Activity y
    on  x.machine_id = y.machine_id 
    and x.process_id = y.process_id 
WHERE
    x.activity_type ='start'
    and y.activity_type ='end'
GROUP By x.machine_id