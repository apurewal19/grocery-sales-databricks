-- customers with no purchases

SELECT 
    c.customerid,
    c.firstname,
    c.lastname
FROM grocery_sales.default.customers c
LEFT JOIN grocery_sales.default.sales s
    ON c.customerid = s.customerid
WHERE s.customerid IS NULL;