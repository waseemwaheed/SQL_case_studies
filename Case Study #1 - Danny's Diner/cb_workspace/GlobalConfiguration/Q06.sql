-- 6. Which item was purchased first by the customer after they became a member?

-- The following solution takes care of the case if there were ties by concatenating them together.

WITH purchases_after_membership AS (
SELECT
    s.customer_id,
    s.order_date,
    s.product_id
FROM
    sales s
INNER JOIN members m ON
    s.customer_id = m.customer_id
WHERE
    s.order_date >= m.join_date
)
SELECT
    t1.customer_id,
    GROUP_CONCAT(t1.product_id ORDER BY product_id SEPARATOR ' | ') first_items_after_membership
FROM
    purchases_after_membership t1
INNER JOIN (
    SELECT
        customer_id,
        MIN(order_date) first_order_date
    FROM
        purchases_after_membership
    GROUP BY
        customer_id) t2 ON
    t1.customer_id = t2.customer_id
WHERE
    t1.order_date = t2.first_order_date
GROUP BY t1.customer_id