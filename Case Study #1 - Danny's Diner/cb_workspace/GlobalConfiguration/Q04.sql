-- 4. What is the most purchased item on the menu and how many times was it purchased by all customers?
SELECT
    DISTINCT product_id,
    COUNT(product_id) times_purchased
FROM
    sales
GROUP BY
    product_id
ORDER BY
    times_purchased DESC
LIMIT 1