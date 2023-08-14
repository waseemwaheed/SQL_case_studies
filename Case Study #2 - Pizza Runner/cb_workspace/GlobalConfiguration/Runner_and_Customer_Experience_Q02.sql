-- B. Runner and Customer Experience: What was the average time in minutes it took for each runner to arrive at the Pizza Runner HQ to pickup the order?

SELECT runner_id,
       Avg(duration_min)
FROM   v_runner_orders vro
GROUP  BY runner_id 