DROP VIEW IF EXISTS v_ranking;

CREATE VIEW v_ranking AS 
WITH T AS  (
    SELECT
        s.customer_id,
        s.order_date,
        m1.product_name,
        m1.price,
        CASE
            WHEN s.order_date >= m2.join_date THEN 'Y'
            ELSE 'N'
        END AS member,
        DENSE_RANK() OVER( PARTITION BY (CASE
            WHEN s.order_date >= m2.join_date THEN s.customer_id
            ELSE NULL
        END)
    ORDER BY
        s.order_date) ranking
    FROM
        sales s
    LEFT JOIN menu m1 ON
        s.product_id = m1.product_id
    LEFT JOIN members m2 ON
        s.customer_id = m2.customer_id
)
SELECT
    customer_id,
    order_date,
    product_name,
    price,
    member,
    (CASE
        WHEN member = 'N'
        THEN NULL
        ELSE ranking
    END) AS ranking
FROM T
ORDER BY
    customer_id,
    order_date;