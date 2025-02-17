SELECT
    p.product_id,
    ROUND
        (IFNULL(sum(p.price * u.units)
            /sum(u.units ), 0), 2
        ) as average_price
FROM Prices p
LEFT JOIN UnitsSold u
    ON p.product_id = u.product_id
    AND u.purchase_date between p.start_date and p.end_date 
GROUP BY
    p.product_id

