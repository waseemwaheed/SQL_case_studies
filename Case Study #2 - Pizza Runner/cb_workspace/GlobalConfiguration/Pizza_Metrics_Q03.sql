-- A. Pizza Metrics - How many successful orders were delivered by each runner?

SELECT runner_id,
       COUNT(*) num_orders
FROM   v_runner_orders vro
WHERE  cancelled IS NULL
GROUP  BY runner_id 