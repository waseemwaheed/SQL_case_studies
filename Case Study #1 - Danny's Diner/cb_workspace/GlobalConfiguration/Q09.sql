-- 9. If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?
SELECT
    s.customer_id,
    SUM(CASE
        WHEN m.product_name = 'sushi' THEN 20 * m.price
        ELSE 10 * m.price
    END) points
FROM
    sales s
LEFT JOIN menu m ON
    s.product_id = m.product_id
GROUP BY
    s.customer_id