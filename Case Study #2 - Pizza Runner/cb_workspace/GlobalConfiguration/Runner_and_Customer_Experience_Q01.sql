-- B. Runner and Customer Experience: How many runners signed up for each 1 week period? (i.e. week starts 2021-01-01)
SELECT
    DATE_ADD('2021-01-01', INTERVAL FLOOR(DAYOFYEAR(registration_date)/ 7)* 7 DAY),
       COUNT(*)
FROM
    runners r
GROUP BY
    DATE_ADD('2021-01-01', INTERVAL FLOOR(DAYOFYEAR(registration_date) / 7) * 7 DAY)