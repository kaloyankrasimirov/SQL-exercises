SELECT
    name,
    TO_CHAR(start_date, 'YYYY-MM-DD HH24:MI:SS') as start_date,
    TO_CHAR(end_date, 'YYYY-MM-DD HH24:MI:SS') as end_date
FROM
    projects
WHERE start_date >= '2016-06-01 07:00:00' AND
      end_date < '2023-06-04 00:00:00'
ORDER BY start_date
