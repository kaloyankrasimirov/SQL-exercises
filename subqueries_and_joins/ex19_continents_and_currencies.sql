CREATE VIEW continent_currency_usage AS
SELECT
    ra.continent_code,
    ra.currency_code,
    ra.currency_usage
FROM (

SELECT
     ct.continent_code,
     ct.currency_code,
     ct.currency_usage,
     DENSE_RANK() OVER (PARTITION BY ct.continent_code ORDER BY ct.currency_usage DESC) AS ranked_by_usage
FROM (
          SELECT
              continent_code,
              currency_code,
              COUNT(currency_code) as currency_usage
          FROM
              countries
          GROUP BY
              continent_code,
              currency_code
          HAVING
              COUNT(currency_code) > 1 -- We see all the continents and the currency usage
      ) AS ct
) as ra
WHERE ra.ranked_by_usage = 1
ORDER BY currency_usage DESC