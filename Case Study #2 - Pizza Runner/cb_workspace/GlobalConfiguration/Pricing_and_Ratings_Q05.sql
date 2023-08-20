-- D. Pricing and Ratings:
-- If a Meat Lovers pizza was $12 and Vegetarian $10 fixed prices with no cost for extras and each runner 
-- is paid $0.30 per kilometre traveled - how much money does Pizza Runner have left over after these deliveries?

SELECT order_id,
       order_details,
       ROUND(order_price - delivery_cost, 1) $_revenue
FROM   (SELECT vco.order_id,
               GROUP_CONCAT(pn.pizza_name ORDER BY pn.pizza_name SEPARATOR ' + '
               )
                      order_details,
               SUM(CASE
                     WHEN pn.pizza_name = 'Meatlovers' THEN 12
                     ELSE 10
                   end)
                      order_price,
               vro.distance_km * 0.3
                      delivery_cost
        FROM   v_customer_orders vco
               LEFT JOIN pizza_names pn
                      ON vco.pizza_id = pn.pizza_id
               LEFT JOIN v_runner_orders vro
                      ON vco.order_id = vro.order_id
        WHERE  vro.cancelled IS NULL
        GROUP  BY vco.order_id,
                  vro.distance_km) t 