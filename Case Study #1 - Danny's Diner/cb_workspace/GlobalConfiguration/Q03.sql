-- 3. What was the first item from the menu purchased by each customer?

SELECT
    DISTINCT customer_id,
    FIRST_VALUE(product_id) over(PARTITION BY customer_id
ORDER BY
    order_date) first_item
FROM
    sales