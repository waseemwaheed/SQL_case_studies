-- A. Pizza Metrics - For each customer, how many delivered pizzas had at least 1 change and how many had no changes?
SELECT customer_id,
       SUM(IF(exclusion1 IS NULL
              AND exclusion2 IS NULL
              AND extra1 IS NULL
              AND extra2 IS NULL, 1, 0))     cnt_no_changes,
       SUM(IF(exclusion1 IS NOT NULL
               OR exclusion2 IS NOT NULL
               OR extra1 IS NOT NULL
               OR extra2 IS NOT NULL, 1, 0)) cnt_had_changes
FROM   v_customer_orders vco
       LEFT JOIN v_runner_orders vro
              ON vco.order_id = vro.order_id
WHERE  vro.cancelled IS NULL
GROUP  BY customer_id 