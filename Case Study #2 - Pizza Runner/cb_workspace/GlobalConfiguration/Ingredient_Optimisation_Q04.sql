-- C. Ingredient Optimisation: 

-- Generate an order item for each record in the customers_orders table in the format of one of the following:
-- Meat Lovers
-- Meat Lovers - Exclude Beef
-- Meat Lovers - Extra Bacon
-- Meat Lovers - Exclude Cheese, Bacon - Extra Mushroom, Peppers

SELECT CONCAT(IF(pn.pizza_name = 'Meatlovers', 'Meat Lovers', 'Vegetarian'),
              IF(vco.exclusion1 IS NOT NULL
                 OR
       vco.exclusion2 IS NOT NULL, ' - Exclude ', ''),
              IF(pt.topping_name IS NOT NULL, pt.topping_name, ''), IF(
              pt2.topping_name IS NOT NULL, CONCAT(', ', pt2.topping_name), ''),
              IF(vco.extra1 IS NOT NULL
       OR vco.extra2 IS NOT NULL, ' - Extra ', ''),
              IF(pt3.topping_name IS NOT NULL, pt3.topping_name, ''),
              IF(pt4.topping_name IS NOT NULL, CONCAT(', ', pt4.topping_name),
              ''))
       order_item
FROM   v_customer_orders vco
       left join pizza_names pn
              ON vco.pizza_id = pn.pizza_id
       left join pizza_toppings pt
              ON vco.exclusion1 = pt.topping_id
       left join pizza_toppings pt2
              ON vco.exclusion2 = pt2.topping_id
       left join pizza_toppings pt3
              ON vco.extra1 = pt3.topping_id
       left join pizza_toppings pt4
              ON vco.extra2 = pt4.topping_id 