SELECT 
    *
FROM cinema
WHERE id % 2 != 0 and description != 'boring'
ORDER By rating desc