-- 10. In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?
-- Scenario 1: Assuming customers don't earn points before joining
SELECT
    s.customer_id,
    SUM(CASE
        WHEN DATEDIFF(s.order_date, m1.join_date)<7 THEN 2
        ELSE 1
    END) points
FROM
    sales s
LEFT JOIN members m1 ON
    s.customer_id = m1.customer_id
WHERE
    s.order_date >= m1.join_date
    AND 
    s.order_date <= '2021-01-31'
GROUP BY
    s.customer_id


-- Scenario 2: Assuming customers earn points even before joining
SELECT
        s.customer_id,
        SUM(CASE
            WHEN DATEDIFF(s.order_date, m1.join_date)<7 AND DATEDIFF(s.order_date, m1.join_date)>= 0 THEN 2
            ELSE 1
        END) points
FROM
        sales s
LEFT JOIN members m1 ON
        s.customer_id = m1.customer_id
WHERE
    s.customer_id IN ('A', 'B')
    AND 
    s.order_date <= '2021-01-31'
GROUP BY
    s.customer_id