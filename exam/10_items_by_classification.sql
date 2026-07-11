CREATE OR REPLACE FUNCTION udf_classification_items_count(classification_name VARCHAR(30))
    RETURNS TEXT AS
$$
DECLARE total_number INT;
BEGIN
    SELECT
        COUNT(*)
    INTO total_number
    FROM
        classifications as cl
    JOIN items as i
    ON cl.id = i.classification_id
    WHERE cl.name = classification_name;

    IF total_number > 0 THEN
        RETURN CONCAT('Found ', total_number, ' items.');
    ELSE
        RETURN 'No items found.';
    END IF;
END;
$$
LANGUAGE plpgsql;