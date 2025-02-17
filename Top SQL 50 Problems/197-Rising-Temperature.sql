select y.id
from Weather x
JOIN weather y
  ON y.recordDate = DATE_ADD(x.recordDate, INTERVAL 1 DAY)
where 
 y.temperature > x.temperature 