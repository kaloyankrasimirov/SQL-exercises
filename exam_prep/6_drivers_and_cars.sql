SELECT
    first_name,
    last_name,
    make,
    model,
    mileage
FROM drivers as d
JOIN cars_drivers as cd
ON cd.driver_id = d.id
JOIN cars as c
ON c.id = cd.car_id
WHERE mileage IS NOT NULL
ORDER BY mileage DESC, first_name

