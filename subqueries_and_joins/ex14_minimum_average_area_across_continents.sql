SELECT
    MIN(individual_avg) as min_average_area
FROM
    (SELECT
         continent_code,
         avg(area_in_sq_km) as individual_avg
     FROM countries
     GROUP BY continent_code) as min_average_area