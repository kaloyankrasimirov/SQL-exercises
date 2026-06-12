SELECT
    id,
    CONCAT(number, ' ', addresses.street) as address,
    city_id
FROM addresses
WHERE id >= 20