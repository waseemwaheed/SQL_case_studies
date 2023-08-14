-- B. Runner and Customer Experience: What was the difference between the longest and shortest delivery times for all orders?

SELECT Max(distance_km) - Min(distance_km) distance_range
FROM   v_runner_orders vro 
