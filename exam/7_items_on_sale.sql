SELECT
    i.name,
    CONCAT(b.name, '/', LOWER(cl.name)) as promotion,
    CONCAT('On sale: ', description) as description,
    i.quantity
FROM
    items as i
LEFT JOIN orders_items as oi
ON oi.item_id = i.id
JOIN brands as b
ON i.brand_id = b.id
JOIN classifications as cl
ON i.classification_id = cl.id
WHERE oi.order_id IS NULL
ORDER BY quantity DESC, i.name


