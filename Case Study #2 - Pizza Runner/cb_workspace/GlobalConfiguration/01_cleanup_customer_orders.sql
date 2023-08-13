-- Assuming no more than two exclusions and two extras.
DROP VIEW IF EXISTS v_customer_orders;

CREATE VIEW v_customer_orders AS
SELECT
    order_id,
    customer_id,
    pizza_id,
    IF(SUBSTRING_INDEX(exclusions, ',', 1) <> 0,
    CAST(SUBSTRING_INDEX(exclusions, ',', 1) AS UNSIGNED),
    NULL) exclusion1,
    IF(LOCATE(',', exclusions)>0,
    CAST(SUBSTRING_INDEX(exclusions, ',', -1) AS UNSIGNED),
    NULL) exclusion2,
    IF(SUBSTRING_INDEX(extras, ',', 1) <> 0,
    CAST(SUBSTRING_INDEX(extras, ',', 1) AS UNSIGNED),
    NULL) extra1,
    IF(LOCATE(',', extras)>0,
    CAST(SUBSTRING_INDEX(extras, ',', -1) AS UNSIGNED),
    NULL) extra2,
    order_time
FROM
    customer_orders co