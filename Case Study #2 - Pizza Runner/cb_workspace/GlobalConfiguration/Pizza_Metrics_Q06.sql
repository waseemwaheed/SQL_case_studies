-- A. Pizza Metrics - What was the maximum number of pizzas delivered in a single order?

SELECT Max(num_pizzas) max_num_pizzas
FROM   (SELECT vco.order_id,
               COUNT(*) num_pizzas
        FROM   v_customer_orders vco
               LEFT JOIN v_runner_orders vro
                      ON vco.order_id = vro.order_id
        WHERE  vro.cancelled IS NULL
        GROUP  BY vco.order_id) t 