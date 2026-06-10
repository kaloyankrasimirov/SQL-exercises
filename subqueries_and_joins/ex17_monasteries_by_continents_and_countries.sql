UPDATE countries
SET country_name = 'Burma'
WHERE country_name = 'Myanmar';

INSERT INTO monasteries(monastery_name, country_code)
VALUES
('Hanga Abbey', (SELECT country_code FROM countries WHERE country_name = 'Tanzania')),
('Myin-Tin-Daik',(SELECT country_code FROM countries WHERE country_name = 'Myanmar'));

SELECT
    co.continent_name,
    c.country_name,
    COUNT(m.id) as monasteries_count
FROM
    countries as c
LEFT JOIN monasteries as m
USING (country_code)
LEFT JOIN continents as co
USING (continent_code)
WHERE c.three_rivers is FALSE
GROUP BY co.continent_name, c.country_name
ORDER BY monasteries_count DESC, c.country_name

