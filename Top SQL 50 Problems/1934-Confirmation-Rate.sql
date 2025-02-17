SELECT 
    s.user_id,
        round(
            IFNULL(sum(case when c.action ='confirmed' then 1 else 0 end)/ ifNull(count(c.user_id),0),0)
            ,2) As confirmation_rate 
FROM Signups s
LEFT JOIN Confirmations c
     on s.user_id = c.user_id 
group by s.user_id
