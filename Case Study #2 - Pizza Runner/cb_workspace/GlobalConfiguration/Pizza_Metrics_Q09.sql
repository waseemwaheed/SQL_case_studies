-- A. Pizza Metrics - What was the total volume of pizzas ordered for each hour of the day?

SELECT   HOUR(order_time) order_hour,
         COUNT(*)         volume_of_pizza
FROM     v_customer_orders vco
GROUP BY HOUR(order_time)
ORDER BY HOUR(order_time)