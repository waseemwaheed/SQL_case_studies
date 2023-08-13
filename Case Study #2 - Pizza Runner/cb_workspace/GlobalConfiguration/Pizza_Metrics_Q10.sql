-- A. Pizza Metrics - What was the volume of orders for each day of the week?

SELECT WEEKDAY(order_time) day_seq,
       DAYNAME(order_time) day_name,
       COUNT(*)            volume_per_day
FROM   v_customer_orders vco
GROUP  BY WEEKDAY(order_time),
          DAYNAME(order_time)
ORDER  BY WEEKDAY(order_time) 