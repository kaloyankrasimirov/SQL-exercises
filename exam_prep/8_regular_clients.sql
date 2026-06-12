SELECT
    c.full_name,
    COUNT(co.car_id) as count_of_cars,
    SUM(bill) as total_sum
FROM
    clients as c
JOIN courses as co
ON c.id = co.client_id
WHERE c.full_name LIKE '_a%'
GROUP BY c.full_name
HAVING COUNT(co.car_id) > 1
ORDER BY c.full_name