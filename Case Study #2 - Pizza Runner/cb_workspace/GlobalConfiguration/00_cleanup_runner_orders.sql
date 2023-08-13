DROP VIEW IF EXISTS v_runner_orders

CREATE VIEW v_runner_orders AS
SELECT
    order_id,
    runner_id,
    CAST(pickup_time AS DATETIME) pickup_time,
    CAST(REGEXP_SUBSTR(distance, '[0-9\.]+') AS FLOAT) distance_km,
    CAST(REGEXP_SUBSTR(duration, '[0-9\.]+') AS UNSIGNED) duration_min,
    CASE
        WHEN cancellation = 'Restaurant Cancellation' THEN 'r'
        WHEN cancellation = 'Customer Cancellation' THEN 'c'
        ELSE NULL
    END cancelled
FROM
    runner_orders ro