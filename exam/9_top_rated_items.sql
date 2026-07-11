SELECT
    i.name as item_name,
    ROUND(AVG(r.rating), 2) as average_rating,
    COUNT(r.customer_id) as total_reviews,
    b.name as brand_name,
    cl.name as classification_name
FROM
    items as i
JOIN reviews as r
ON r.item_id = i.id
JOIN brands as b
ON i.brand_id = b.id
JOIN classifications as cl
ON i.classification_id = cl.id
GROUP BY i.name, b.name, cl.name
HAVING COUNT(r.item_id) >= 3
ORDER BY average_rating DESC, item_name
LIMIT 3





