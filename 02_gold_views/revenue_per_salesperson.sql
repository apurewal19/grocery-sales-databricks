-- revenue per salesperson

CREATE OR REPLACE VIEW grocery_sales.gold.revenue_per_salesperson AS
SELECT 
    e.firstname,
    e.lastname,
    ROUND(SUM(s.quantity * p.price), 0) AS revenue,
    RANK() OVER(ORDER BY SUM(s.quantity * p.price) DESC) AS Rank
FROM grocery_sales.default.sales s
JOIN grocery_sales.default.employees e
    ON s.salespersonid = e.employeeid
JOIN grocery_sales.default.products p
    ON s.productid = p.productid
GROUP BY e.firstname, e.lastname