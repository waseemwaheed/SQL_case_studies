-- 2. How many days has each customer visited the restaurant?
USE ANALYTICS_DB;

SELECT
    CUSTOMER_ID,
    COUNT(DISTINCT ORDER_DATE) NUM_DAYS
FROM
    SALES
GROUP BY
    CUSTOMER_ID