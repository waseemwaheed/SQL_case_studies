-- C. Ingredient Optimisation: What was the most commonly added extra?

SELECT pt.topping_name
FROM   (SELECT extra1 extra
        FROM   v_customer_orders vco
        WHERE  extra1 IS NOT NULL
        UNION ALL
        SELECT extra2 extra
        FROM   v_customer_orders vco2
        WHERE  extra2 IS NOT NULL) t
LEFT JOIN pizza_toppings pt
       ON t.extra = pt.topping_id
GROUP  BY pt.topping_name
ORDER  BY COUNT(extra) DESC
LIMIT  1 