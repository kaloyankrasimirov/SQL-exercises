SELECT
    a.name,
    SUM(booked_for) as sum
FROM
    apartments as a
JOIN bookings as b
USING (apartment_id)
GROUP BY name
ORDER BY name


