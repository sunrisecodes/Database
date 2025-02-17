SELECT 
    y.name
FROM Employee x
JOIN Employee y
    ON x.managerId = y.id
GROUP BY x.managerId
HAVING count(x.managerId) >= 5