-- B. Runner and Customer Experience: What was the average speed for each runner for each delivery and do you notice any trend for these values?
-- Answer: a customer tend to order pizzas around the same time 

SELECT vro.order_id,
       vro.runner_id,
       vco.customer_id,
       vro.distance_km,
       vro.duration_min,
       HOUR(vro.pickup_time)                         htd,
       vro.distance_km / ( vro.duration_min / 60.0 ) speed_km_per_min
FROM   v_runner_orders vro
       LEFT JOIN v_customer_orders vco
              ON vro.order_id = vco.order_id
WHERE  vro.cancelled IS NULL
ORDER  BY vco.customer_id,
          HOUR(vro.pickup_time) 