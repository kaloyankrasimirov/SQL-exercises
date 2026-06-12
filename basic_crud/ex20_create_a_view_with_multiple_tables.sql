CREATE VIEW view_addresses AS
SELECT
    CONCAT(first_name, ' ', last_name) as full_name,
    department_id,
    CONCAT(number, ' ', street) as address
FROM
    employees
JOIN addresses as a
ON a.id = address_id
ORDER BY address