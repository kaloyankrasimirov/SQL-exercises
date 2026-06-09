SELECT
    mountain_range,
    peak_name,
    elevation
FROM
    peaks
        JOIN mountains AS m on peaks.mountain_id = m.id
WHERE mountain_range = 'Rila'
ORDER BY elevation DESC