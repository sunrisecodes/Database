SELECT
    e.name,
    b.bonus
FROM employee e
left JOIN bonus b
     ON e.empId = b.empId 
WHERE
    b.bonus < 1000 or b.bonus is null