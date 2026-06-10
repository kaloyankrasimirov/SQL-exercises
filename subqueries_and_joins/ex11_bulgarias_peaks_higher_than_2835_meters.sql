SELECT
    country_code,
    mountain_range,
    peak_name,
    elevation
FROM
    mountains as m
JOIN peaks as p
ON p.mountain_id = m.id
JOIN mountains_countries as mc
USING (mountain_id)
WHERE country_code = 'BG' AND elevation > 2835
ORDER BY elevation DESC