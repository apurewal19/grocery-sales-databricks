-- revenue by product category

CREATE OR REPLACE VIEW grocery_sales.gold.revenue_by_category AS
SELECT 
    c.categoryname,
    ROUND(SUM(s.quantity * p.price)) AS revenue
FROM grocery_sales.default.sales s
JOIN grocery_sales.default.products p
    ON s.productid = p.productid
JOIN grocery_sales.default.categories c
    ON p.categoryid = c.categoryid
GROUP BY c.categoryname
ORDER BY 2 DESC