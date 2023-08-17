-- C. Ingredient Optimisation:
-- Generate an alphabetically ordered comma separated ingredient list for each pizza order from the customer_orders table and add a 2x in front of any relevant ingredients
-- For example: "Meat Lovers: 2xBacon, Beef, ... , Salami"
WITH t1 AS
(
          SELECT    vco.pizza_id,
                    pn.pizza_name,
                    pt1.topping_name    exc1,
                    pt2.topping_name    exc2,
                    pt3.topping_name    ext1,
                    pt4.topping_name    ext2,
                    ROW_NUMBER() OVER() customer_pizza_id
          FROM      v_customer_orders vco
          LEFT JOIN pizza_names pn
          ON        vco.pizza_id = pn.pizza_id
          LEFT JOIN pizza_toppings pt1
          ON        vco.exclusion1 = pt1.topping_id
          LEFT JOIN pizza_toppings pt2
          ON        vco.exclusion2 = pt2.topping_id
          LEFT JOIN pizza_toppings pt3
          ON        vco.extra1 = pt3.topping_id
          LEFT JOIN pizza_toppings pt4
          ON        vco.extra2 = pt4.topping_id ), t2 AS
(
          SELECT    t1.customer_pizza_id,
                    t1.pizza_id,
                    t1.pizza_name,
                    t1.exc1,
                    t1.exc2,
                    t1.ext1,
                    t1.ext2,
                    pt.topping_name,
                    CASE
                              WHEN t1.exc1 = pt.topping_name
                              OR        t1.exc2 = pt.topping_name THEN NULL
                              WHEN t1.ext1 = pt.topping_name
                              OR        t1.ext2 = pt.topping_name THEN CONCAT('2x', pt.topping_name)
                              ELSE pt.topping_name
                    END aug_topping_name
          FROM      t1
          LEFT JOIN v_pizza_recipes vpr
          ON        t1.pizza_id = vpr.pizza_id
          LEFT JOIN pizza_toppings pt
          ON        vpr.topping = pt.topping_id )
SELECT   CONCAT(pizza_name, ': ', GROUP_CONCAT(aug_topping_name ORDER BY topping_name SEPARATOR ', ')) ingredients_list
FROM     t2
GROUP BY customer_pizza_id,
         pizza_name