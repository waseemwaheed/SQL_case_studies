-- A. Pizza Metrics - How many Vegetarian and Meatlovers were ordered by each customer?

SELECT vco.customer_id,
       pn.pizza_name,
       COUNT(*) cnt_ordered
FROM   v_customer_orders vco
       LEFT JOIN pizza_names pn
              ON vco.pizza_id = pn.pizza_id
GROUP  BY vco.customer_id,
          pn.pizza_name
ORDER  BY vco.customer_id 