-- days with sales (JAN - MAY)

CREATE OR REPLACE VIEW grocery_sales.gold.days_with_sales AS
WITH monthly AS (
  SELECT
      DATE_TRUNC('month', s.salesdate)  AS month,
      SUM(s.quantity * p.price)         AS revenue,
      COUNT(DISTINCT DATE(s.salesdate)) AS days_with_sales
  FROM grocery_sales.default.sales s
  JOIN grocery_sales.default.products p ON s.productid = p.productid
  WHERE s.salesdate IS NOT NULL
  GROUP BY DATE_TRUNC('month', s.salesdate)
)
SELECT
    month, revenue, days_with_sales,
    ROUND(revenue / days_with_sales, 2) AS avg_daily_revenue
FROM monthly;