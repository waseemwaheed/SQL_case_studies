-- D. Pricing and Ratings: What if there was an additional $1 charge for any pizza extras?
-- For example, add cheese is $1 extra

SELECT vro.runner_id,
       SUM(CASE WHEN pn.pizza_name = 'Meatlovers' THEN 12 ELSE 10 END + CASE
           WHEN
           vco.extra1 IS NOT NULL AND vco.extra2 IS NOT NULL THEN 2 WHEN
           vco.extra1 IS
           NOT NULL
           AND vco.extra2 IS NULL THEN 1 ELSE 0 END) $_made
FROM   v_customer_orders vco
       LEFT JOIN v_runner_orders vro
              ON vco.order_id = vro.order_id
       LEFT JOIN pizza_names pn
              ON vco.pizza_id = pn.pizza_id
WHERE  vro.cancelled IS NULL
GROUP  BY vro.runner_id 