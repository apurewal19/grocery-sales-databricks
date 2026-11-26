-- displays unique salesdates

SELECT
    MIN(DATE(salesdate))            AS first_day,
    MAX(DATE(salesdate))            AS last_day,
    COUNT(DISTINCT DATE(salesdate)) AS unique_days
FROM grocery_sales.default.sales;