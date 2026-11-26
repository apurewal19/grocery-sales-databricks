-- top 3 products partitioned by category

CREATE OR REPLACE VIEW grocery_sales.gold.top_products_per_category AS
WITH sort_by_category AS (
SELECT 
    c.categoryname,
    p.productname,
    ROUND(SUM(p.price * s.quantity), 0) AS revenue,
    ROW_NUMBER() OVER(PARTITION BY c.categoryname ORDER BY SUM(p.price * s.quantity) DESC) AS row_num
FROM grocery_sales.default.sales s
JOIN grocery_sales.default.products p
    ON s.productid = p.productid
JOIN grocery_sales.default.categories c
    ON p.categoryid = c.categoryid
GROUP BY categoryname, p.productname
)

SELECT 
    categoryname,
    productname,
    revenue,
    row_num
FROM sort_by_category
WHERE row_num <= 3