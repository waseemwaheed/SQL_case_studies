-- B. Runner and Customer Experience: What is the successful delivery percentage for each runner?

SELECT runner_id,
       SUM(IF(cancelled IS NULL, 1, 0)) / COUNT(*) * 100 pct_successful_delivery
FROM   v_runner_orders vro
GROUP  BY runner_id 