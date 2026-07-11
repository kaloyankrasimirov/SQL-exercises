CREATE OR REPLACE PROCEDURE udp_update_loyalty_status(min_orders INT)
AS
$$
BEGIN
    UPDATE customers
    SET loyalty_card = TRUE
    WHERE id in (
    SELECT
    c.id
FROM
    customers as c
        JOIN orders as o
             on o.customer_id = c.id
GROUP BY c.id
HAVING COUNT(o.customer_id) >= min_orders
    );
END;
$$
    LANGUAGE plpgsql;
