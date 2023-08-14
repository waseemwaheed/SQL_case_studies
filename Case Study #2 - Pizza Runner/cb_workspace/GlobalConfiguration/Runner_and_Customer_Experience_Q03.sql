-- B. Runner and Customer Experience: Is there any relationship between the number of pizzas and how long the order takes to prepare?

SELECT runner_id,
       Avg(duration_min) avg_duration,
       Count(*)          num_ordered
FROM   v_runner_orders vro
GROUP  BY runner_id 