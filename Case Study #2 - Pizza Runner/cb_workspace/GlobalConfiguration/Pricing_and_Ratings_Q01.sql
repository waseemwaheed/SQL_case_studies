-- D. Pricing and Ratings: If a Meat Lovers pizza costs $12 and Vegetarian costs $10 and there were no charges for changes 
-- how much money has Pizza Runner made so far if there are no delivery fees?

SELECT vro.runner_id,
       SUM(CASE
             WHEN pn.pizza_name = 'Meatlovers' THEN 12
             ELSE 10
           END) $_made
FROM   v_customer_orders vco
       LEFT JOIN v_runner_orders vro
              ON vco.order_id = vro.order_id
       LEFT JOIN pizza_names pn
              ON vco.pizza_id = pn.pizza_id
WHERE  vro.cancelled IS NULL
GROUP  BY vro.runner_id 