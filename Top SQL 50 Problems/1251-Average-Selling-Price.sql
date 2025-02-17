SELECT
    p.product_id,
    ROUND
        (IFNULL(sum(CASE WHEN u.purchase_date between p.start_date and p.end_date then p.price * u.units end)
            /sum(CASE WHEN u.purchase_date between p.start_date and p.end_date then u.units end ), 0), 2
        ) as average_price
FROM Prices p
LEFT JOIN UnitsSold u
    ON p.product_id = u.product_id
GROUP BY
    p.product_id

