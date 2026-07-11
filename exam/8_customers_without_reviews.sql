SELECT
    o.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) as full_name,
    COUNT(o.id) AS total_orders,
    CASE
        WHEN c.loyalty_card IS TRUE THEN 'Loyal Customer'
        ELSE 'Regular Customer'
    END AS loyalty_status
FROM
    customers as c
LEFT JOIN reviews as r
ON r.customer_id = c.id
JOIN orders as o
ON o.customer_id = c.id
WHERE r.customer_id IS NULL
GROUP BY o.customer_id, full_name, loyalty_status
ORDER BY total_orders DESC, customer_id