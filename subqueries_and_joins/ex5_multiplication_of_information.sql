SELECT
    booking_id,
    first_name as customer_name
FROM
    bookings as b
CROSS JOIN customers as c
ORDER BY customer_name