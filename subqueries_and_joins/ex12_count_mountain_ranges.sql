SELECT
    mc.country_code,
    COUNT(DISTINCT m.mountain_range) as mountain_range_count
FROM
    mountains as m
JOIN mountains_countries as mc
ON mc.mountain_id = m.id
WHERE country_code in ('BG', 'RU', 'US')
GROUP BY mc.country_code
ORDER BY mountain_range_count DESC

