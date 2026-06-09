SELECT
    COUNT(countries.country_code) AS countries_without_rivers
FROM
    countries
        LEFT JOIN countries_rivers AS rm ON rm.country_code = countries.country_code
WHERE rm.country_code IS NULL