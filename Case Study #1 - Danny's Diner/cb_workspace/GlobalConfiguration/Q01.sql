-- 1. What is the total amount each customer spent at the restaurant?

USE analytics_db;
SELECT
    T1.CUSTOMER_ID,
    SUM(T2.PRICE) AS TOTAL_AMOUNT
FROM
    SALES T1
RIGHT JOIN MENU T2 ON
    T1.PRODUCT_ID = T2.PRODUCT_ID
GROUP BY
    T1.CUSTOMER_ID
ORDER BY
    T1.CUSTOMER_ID
