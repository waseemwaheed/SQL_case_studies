-- 8. What is the total items and amount spent for each member before they became a member?
SELECT
    s.customer_id,
    COUNT(s.product_id) num_items,
    SUM(m2.price) amount_spent
FROM
    sales s
LEFT JOIN members m1
ON
    s.customer_id = m1.customer_id
LEFT JOIN menu m2
ON
    s.product_id = m2.product_id
WHERE
    s.order_date < m1.join_date
GROUP BY
    s.customer_id