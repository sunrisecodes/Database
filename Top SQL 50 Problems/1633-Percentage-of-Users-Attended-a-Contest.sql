SELECT
    r.contest_id,
    ROUND((count(r.user_id) /(SELECT count(user_id) from users)) *100, 2) as percentage 
FROM register r
JOIN users u
    ON u.user_id = r.user_id
GROUP BY r.contest_id
ORDER BY percentage desc, r.contest_id asc