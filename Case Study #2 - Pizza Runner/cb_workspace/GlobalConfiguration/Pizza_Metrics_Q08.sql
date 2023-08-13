-- A. Pizza Metrics - How many pizzas were delivered that had both exclusions and extras?

SELECT COUNT(*) cnt_with_exclusions_and_extras
FROM   v_customer_orders vco
WHERE  ( exclusion1 IS NOT NULL
          OR exclusion2 IS NOT NULL )
       AND ( extra1 IS NOT NULL
              OR extra2 IS NOT NULL ) 