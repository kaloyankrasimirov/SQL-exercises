ALTER TABLE countries_rivers
    ADD FOREIGN KEY(river_id)
        REFERENCES rivers(id)
        ON UPDATE CASCADE,


    ADD FOREIGN KEY(country_code)
        REFERENCES countries(country_code)
        ON UPDATE CASCADE;