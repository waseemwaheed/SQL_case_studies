-- A. Pizza Metrics - How many of each type of pizza was delivered?

SELECT pn.pizza_name,
       COUNT(*) count_delivered
FROM   v_customer_orders vco
       LEFT JOIN pizza_names pn
              ON vco.pizza_id = pn.pizza_id
       LEFT JOIN v_runner_orders vro
              ON vco.order_id = vro.order_id
WHERE  vro.cancelled IS NULL
GROUP  BY pn.pizza_name 