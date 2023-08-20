-- C. Ingredient Optimisation: What is the total quantity of each ingredient used in all delivered pizzas sorted by most frequent first?

WITH standard_quantities
     AS (SELECT pt.topping_name,
                Count(pt.topping_name) quantity
         FROM   v_customer_orders vco
                LEFT JOIN v_pizza_recipes vpr
                       ON vco.pizza_id = vpr.pizza_id
                LEFT JOIN pizza_toppings pt
                       ON vpr.topping = pt.topping_id
                LEFT JOIN v_runner_orders vro
                       ON vco.order_id = vro.order_id
         WHERE  vro.cancelled IS NULL
         GROUP  BY pt.topping_name),
     exclusion_quantities
     AS (SELECT topping_name,
                Count(topping_name) quantity
         FROM   (SELECT pt.topping_name
                 FROM   v_customer_orders vco
                        LEFT JOIN pizza_toppings pt
                               ON vco.exclusion1 = pt.topping_id
                        LEFT JOIN v_runner_orders vro
                               ON vco.order_id = vro.order_id
                 WHERE  vro.cancelled IS NULL
                        AND vco.exclusion1 IS NOT NULL
                 UNION ALL
                 SELECT pt.topping_name
                 FROM   v_customer_orders vco
                        LEFT JOIN pizza_toppings pt
                               ON vco.exclusion2 = pt.topping_id
                        LEFT JOIN v_runner_orders vro
                               ON vco.order_id = vro.order_id
                 WHERE  vro.cancelled IS NULL
                        AND vco.exclusion2 IS NOT NULL) t
         GROUP  BY topping_name),
     extra_quantities
     AS (SELECT topping_name,
                Count(topping_name) quantity
         FROM   (SELECT pt.topping_name
                 FROM   v_customer_orders vco
                        LEFT JOIN pizza_toppings pt
                               ON vco.extra1 = pt.topping_id
                        LEFT JOIN v_runner_orders vro
                               ON vco.order_id = vro.order_id
                 WHERE  vro.cancelled IS NULL
                        AND vco.extra1 IS NOT NULL
                 UNION ALL
                 SELECT pt.topping_name
                 FROM   v_customer_orders vco
                        LEFT JOIN pizza_toppings pt
                               ON vco.extra2 = pt.topping_id
                        LEFT JOIN v_runner_orders vro
                               ON vco.order_id = vro.order_id
                 WHERE  vro.cancelled IS NULL
                        AND vco.extra2 IS NOT NULL) t
         GROUP  BY topping_name)
SELECT sq.topping_name,
       sq.quantity - COALESCE(ecq.quantity, 0) + COALESCE(etq.quantity, 0)
       total_quantities
FROM   standard_quantities sq
       LEFT JOIN exclusion_quantities ecq
              ON sq.topping_name = ecq.topping_name
       LEFT JOIN extra_quantities etq
              ON sq.topping_name = etq.topping_name
ORDER  BY sq.quantity - COALESCE(ecq.quantity, 0) + COALESCE(etq.quantity, 0) DESC 