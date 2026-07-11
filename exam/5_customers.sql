SELECT
    id,
    last_name,
    loyalty_card
FROM
    customers
WHERE loyalty_card IS TRUE AND last_name ILIKE '%M%'
ORDER BY last_name DESC
