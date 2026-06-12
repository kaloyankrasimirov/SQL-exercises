SELECT
    a.name as address,
    CASE
        WHEN EXTRACT(HOUR FROM co.start) BETWEEN 6 AND 20 THEN 'Day'
        ELSE 'Night'
    END AS day_time,
    co.bill,
    cl.full_name,
    ca.make,
    ca.model,
    cat.name
FROM
    courses as co
JOIN cars as ca
ON co.car_id = ca.id
JOIN addresses as a
ON a.id = co.from_address_id
JOIN clients as cl
ON cl.id = co.client_id
JOIN categories as cat
ON cat.id = ca.category_id
ORDER BY co.id