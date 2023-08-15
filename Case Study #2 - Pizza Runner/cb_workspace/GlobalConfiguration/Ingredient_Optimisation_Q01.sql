-- C. Ingredient Optimisation: What are the standard ingredients for each pizza?

SELECT pn.pizza_name,
       GROUP_CONCAT(pt.topping_name ORDER BY pt.topping_name SEPARATOR ' + ') ingredients
FROM   v_pizza_recipes vpr,
       pizza_toppings pt,
       pizza_names pn
WHERE  vpr.topping = pt.topping_id
       AND vpr.pizza_id = pn.pizza_id
GROUP  BY pn.pizza_name 