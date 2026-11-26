-- sales by city

CREATE OR REPLACE VIEW grocery_sales.gold.sales_by_city AS
SELECT
    cities.cityname,
    COUNT(*) AS number_of_transactions,
    SUM(sales.quantity) AS volume,
    ROUND(SUM(sales.quantity * prod.price), 0) AS revenue
FROM grocery_sales.default.sales sales
JOIN grocery_sales.default.products prod
    ON sales.productid = prod.productid
JOIN grocery_sales.default.customers cust
    ON sales.customerid = cust.customerid
JOIN grocery_sales.default.cities cities
    ON cust.cityid = cities.cityid
GROUP BY cities.cityname
ORDER BY revenue DESC