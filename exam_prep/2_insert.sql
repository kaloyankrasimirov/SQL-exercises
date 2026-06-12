INSERT INTO clients(full_name, phone_number)
SELECT
    CONCAT(first_name, ' ', last_name) as full_name,
    '(088) 9999' || id * 2

FROM drivers
WHERE id BETWEEN 10 and 20
