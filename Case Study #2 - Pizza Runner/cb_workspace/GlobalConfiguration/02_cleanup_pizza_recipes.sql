DROP VIEW IF EXISTS v_pizza_recipes;

CREATE VIEW v_pizza_recipes
AS
  WITH t1
       AS (SELECT pizza_id,
                  toppings,
                  Length(toppings) - Length(Replace(toppings, ',', ''))
                  num_commas
           FROM   pizza_recipes pr),
       t2
       AS (SELECT pizza_id,
                  CONCAT(toppings, REPEAT(', ', Max(num_commas)
                                                  OVER(
                                                    ORDER BY pizza_id)
                                                - num_commas))
                     toppings
           FROM   t1),
       t3
       AS (SELECT pizza_id,
                  CAST(Substring_index(toppings, ',', 1) AS UNSIGNED) topping
           FROM   t2
           UNION
           SELECT pizza_id,
                  CAST(Substring_index(Substring_index(toppings, ',', 2), ', ',
                       -1
                       ) AS
                       UNSIGNED)
                  topping
           FROM   t2
           UNION
           SELECT pizza_id,
                  CAST(Substring_index(Substring_index(toppings, ',', 3), ', ',
                       -1
                       ) AS
                       UNSIGNED)
                  topping
           FROM   t2
           UNION
           SELECT pizza_id,
                  CAST(Substring_index(Substring_index(toppings, ',', 4), ', ',
                       -1
                       ) AS
                       UNSIGNED)
                  topping
           FROM   t2
           UNION
           SELECT pizza_id,
                  CAST(Substring_index(Substring_index(toppings, ',', 5), ', ',
                       -1
                       ) AS
                       UNSIGNED)
                  topping
           FROM   t2
           UNION
           SELECT pizza_id,
                  CAST(Substring_index(Substring_index(toppings, ',', 6), ', ',
                       -1
                       ) AS
                       UNSIGNED)
                  topping
           FROM   t2
           UNION
           SELECT pizza_id,
                  CAST(Substring_index(Substring_index(toppings, ',', 7), ', ',
                       -1
                       ) AS
                       UNSIGNED)
                  topping
           FROM   t2
           UNION
           SELECT pizza_id,
                  CAST(Substring_index(Substring_index(toppings, ',', 8), ', ',
                       -1
                       ) AS
                       UNSIGNED)
                  topping
           FROM   t2)
  SELECT pizza_id,
         topping
  FROM   t3
  WHERE  topping <> 0
  ORDER  BY pizza_id,
            topping 