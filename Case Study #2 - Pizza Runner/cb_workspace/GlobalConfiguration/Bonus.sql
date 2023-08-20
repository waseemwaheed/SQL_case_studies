-- Bonus Question: If Danny wants to expand his range of pizzas 
-- - how would this impact the existing data design? 
-- Write an INSERT statement to demonstrate what would happen if a new Supreme pizza 
-- with all the toppings was added to the Pizza Runner menu?

-- Answer: Danny would need to add a new pizza in the pizza_names table and a new row in the
-- pizza_recipe table with all the ingredients.
-- These changes are going to break some of the other queries that assumed the recipe can 
-- contain 8 toppings only. The view v_pizza_recipes should be reviewed in this case.
-- Howerever, to insert the new values:
INSERT INTO pizza_names
            (pizza_id,
             pizza_name)
VALUES      (3,
             'Supreme');

INSERT INTO pizza_recipes
            (pizza_id,
             toppings)
VALUES     (3,
            '1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 11, 12'); 