-- Pricing and Ratings: 
-- Using your newly generated table - can you join all of the information together to form a table 
-- which has the following information for successful deliveries?
-- * customer_id
-- * order_id
-- * runner_id
-- * rating
-- * order_time
-- * pickup_time
-- * Time between order and pickup
-- * Delivery duration
-- * Average speed
-- * Total number of pizzas

SELECT vco.customer_id,
       vro.order_id,
       vro.runner_id,
       ro.rating_id,
       vco.order_time,
       vro.pickup_time,
       TIMEDIFF(vro.pickup_time, vco.order_time)   time_diff,
       vro.duration_min,
       vro.distance_km / ( vro.duration_min / 60 ) average_speed_kmph,
       Count(vco.pizza_id)                         total_pizzas
FROM   v_runner_orders vro
       LEFT JOIN runner_orders ro
              ON vro.order_id = ro.order_id
       LEFT JOIN v_customer_orders vco
              ON vro.order_id = vco.order_id
WHERE  vro.cancelled IS NULL
GROUP  BY vco.customer_id,
          vro.order_id,
          vro.runner_id,
          ro.rating_id,
          vco.order_time,
          vro.pickup_time,
          TIMEDIFF(vro.pickup_time, vco.order_time),
          vro.duration_min,
          vro.distance_km / ( vro.duration_min / 60 ) 