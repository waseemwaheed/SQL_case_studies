-- C. Ingredient Optimisation: What was the most common exclusion?

SELECT pt.topping_name
FROM   (SELECT exclusion1 ex
        FROM   v_customer_orders vco
        WHERE  exclusion1 IS NOT NULL
        UNION ALL
        SELECT exclusion2 ex
        FROM   v_customer_orders vco2
        WHERE  exclusion2 IS NOT NULL) t
LEFT JOIN pizza_toppings pt
       ON t.ex = pt.topping_id
GROUP  BY pt.topping_name
ORDER  BY COUNT(ex) DESC
LIMIT  1 