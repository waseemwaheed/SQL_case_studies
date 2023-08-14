-- B. Runner and Customer Experience: What was the average distance travelled for each customer?

SELECT vco.customer_id,
       Avg(vro.distance_km) avg_distance
FROM   v_runner_orders vro
       LEFT JOIN v_customer_orders vco
              ON vro.order_id = vco.order_id
WHERE  vro.cancelled IS NULL
GROUP  BY vco.customer_id 
