-- sales by top 10 customers

CREATE OR REPLACE VIEW grocery_sales.gold.top_customers AS
SELECT
    c.customerid,
    c.firstname,
    c.lastname,
    c.full_name,
    SUM(s.quantity) AS total_quantity
FROM grocery_sales.default.customers c
JOIN grocery_sales.default.sales s
    ON c.customerid = s.customerid
GROUP BY c.customerid, c.firstname, c.lastname, c.full_name
ORDER BY total_quantity DESC
LIMIT 10