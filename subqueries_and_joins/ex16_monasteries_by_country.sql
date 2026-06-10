CREATE TABLE monasteries(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    monastery_name VARCHAR (255),
    country_code VARCHAR (2)
);

INSERT INTO monasteries(monastery_name, country_code)
VALUES
    ('Rila Monastery "St. Ivan of Rila"', 'BG'),
    ('Bachkovo Monastery "Virgin Mary"', 'BG'),
    ('Troyan Monastery "Holy Mother''s Assumption"', 'BG'),
    ('Kopan Monastery', 'NP'),
    ('Thrangu Tashi Yangtse Monastery', 'NP'),
    ('Shechen Tennyi Dargyeling Monastery', 'NP'),
    ('Benchen Monastery', 'NP'),
    ('Southern Shaolin Monastery', 'CN'),
    ('Dabei Monastery', 'CN'),
    ('Wa Sau Toi', 'CN'),
    ('Lhunshigyia Monastery', 'CN'),
    ('Rakya Monastery', 'CN'),
    ('Monasteries of Meteora', 'GR'),
    ('The Holy Monastery of Stavronikita', 'GR'),
    ('Taung Kalat Monastery', 'MM'),
    ('Pa-Auk Forest Monastery', 'MM'),
    ('Taktsang Palphug Monastery', 'BT'),
    ('Sümela Monastery', 'TR');

ALTER TABLE countries
ADD COLUMN three_rivers BOOLEAN DEFAULT FALSE;

UPDATE countries
SET three_rivers = TRUE
WHERE (SELECT COUNT(*)
       FROM countries_rivers
       WHERE countries_rivers.country_code = countries.country_code) >= 3;

SELECT
    monastery_name as monastery,
    country_name as country
FROM
    monasteries as m
JOIN countries as c
USING (country_code)
WHERE three_rivers IS FALSE
order by monastery