-- A. Pizza Metrics - How many unique customer orders were made?

SELECT COUNT(DISTINCT order_id) unique_orders
FROM   v_runner_orders vro
WHERE  cancelled IS NULL 