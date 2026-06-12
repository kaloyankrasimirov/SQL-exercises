SELECT
    c.id as car_id,
    make,
    mileage,
    COUNT(co.car_id) as count_of_courses,
    ROUND(AVG(bill), 2) as average_bill
FROM cars as c
LEFT JOIN courses as co
ON co.car_id = c.id
GROUP BY c.id, make, mileage
HAVING COUNT(co.car_id) <> 2
ORDER BY count_of_courses DESC, car_id