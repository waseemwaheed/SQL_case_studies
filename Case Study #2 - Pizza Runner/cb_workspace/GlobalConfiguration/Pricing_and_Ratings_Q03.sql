-- D. Pricing and Ratings:
-- The Pizza Runner team now wants to add an additional ratings system that allows customers 
-- to rate their runner, how would you design an additional table for this new dataset 
-- - generate a schema for this new table and insert your own data for ratings for each 
-- successful customer order between 1 to 5.

-- Step 1: create new table named `ratings` that will contain the allowable ratings
-- this will ensure that ratings can only be between 1 and 5 inclusive
DROP TABLE IF EXISTS ratings;

CREATE TABLE ratings
  (
     rating_id    INT NOT NULL,
     rating_value INT,
     PRIMARY KEY (rating_id)
  );

-- Step2 2: modify `runner_orders` to include a foreign key referencing rating_id in the table `ratings`
ALTER TABLE runner_orders
  ADD rating_id INT,
  ADD FOREIGN KEY (rating_id) REFERENCES ratings(rating_id);

-- Step 3: populate the `ratings` table
INSERT INTO ratings
            (rating_id,
             rating_value)
VALUES      (1,
             1),
            (2,
             2),
            (3,
             3),
            (4,
             4),
            (5,
             5);

-- Step 4: populate the ratings (randomly) in the `runner_orders` tables
UPDATE runner_orders
SET    rating_id = 5
WHERE  order_id = 1;

UPDATE runner_orders
SET    rating_id = 4
WHERE  order_id = 2;

UPDATE runner_orders
SET    rating_id = 2
WHERE  order_id = 3;

UPDATE runner_orders
SET    rating_id = 5
WHERE  order_id = 4;

UPDATE runner_orders
SET    rating_id = 4
WHERE  order_id = 5;

UPDATE runner_orders
SET    rating_id = 3
WHERE  order_id = 7;

UPDATE runner_orders
SET    rating_id = 5
WHERE  order_id = 8;

UPDATE runner_orders
SET    rating_id = 5
WHERE  order_id = 10; 