-- A. Pizza Metrics - How many pizzas were ordered?
-- Solution finds pizzas in orders that were not cancelled.

SELECT COUNT(*)
FROM   v_customer_orders vco
       LEFT JOIN v_runner_orders vro
              ON vco.order_id = vro.order_id
WHERE  vro.cancelled IS NULL 