-- 5. Which item was the most popular for each customer?
WITH purchase_counts_per_customer AS (
SELECT
    customer_id,
    product_id,
    COUNT(product_id) cnt_per_product,
    MAX(COUNT(product_id)) OVER(PARTITION BY customer_id) max_cnt
FROM
    sales
GROUP BY
    customer_id,
    product_id
)
SELECT
    customer_id,
    GROUP_CONCAT(m.product_name SEPARATOR ' | ') most_popular
FROM
    purchase_counts_per_customer p
LEFT JOIN menu m ON
    m.product_id = p.product_id
WHERE
    cnt_per_product = max_cnt
GROUP BY
    customer_id