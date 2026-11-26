-- top 10 and bottom 10 products by revenue

CREATE OR REPLACE VIEW grocery_sales.gold.top_bottom_products AS
WITH product_revenue AS (
SELECT 
    p.productid,
    p.productname,
    ROUND(SUM(s.quantity * p.price), 0) AS revenue
FROM grocery_sales.default.sales s
JOIN grocery_sales.default.products p
    ON s.productid = p.productid
GROUP BY p.productid, p.productname
),

ranked AS ( 
SELECT 
    *,
    RANK() OVER(ORDER BY revenue DESC) AS rank_top,
    RANK() OVER(ORDER BY revenue ASC) AS rank_bottom
FROM product_revenue
)

SELECT
    productid,
    productname,
    revenue,
    rank_top,
    CASE WHEN rank_top <= 10 THEN 'Top 10' ELSE 'Bottom 10' END AS group_label
FROM ranked
WHERE rank_top <= 10 OR rank_bottom <= 10
ORDER BY revenue DESC;