-- Which item was purchased just before the customer became a member?
-- The following solution finds the most recent purchase before becoming a member for each customer. 
-- The solution handles the case of multiple products on the same date.

WITH purchases_before_memebership AS (
SELECT
    s.customer_id,
    s.product_id,
    s.order_date,
    MAX(order_date) OVER(PARTITION BY s.customer_id) most_recent
FROM
    sales s
LEFT JOIN members m
ON
    s.customer_id = m.customer_id
WHERE
    s.order_date < m.join_date
)
SELECT
    pbm.customer_id,
    GROUP_CONCAT(m.product_name SEPARATOR ' | ')
FROM
    purchases_before_memebership pbm
LEFT JOIN menu m
ON
    pbm.product_id = m.product_id
WHERE
    order_date = most_recent
GROUP BY
    customer_id