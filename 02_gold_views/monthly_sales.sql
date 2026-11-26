-- monthly sales and trends

CREATE OR REPLACE VIEW grocery_sales.gold.monthly_sales AS
WITH monthly AS (
  SELECT
      DATE_TRUNC('month', s.salesdate) AS month,
      SUM(s.quantity * p.price)        AS revenue,
      SUM(s.quantity)                  AS units_sold
  FROM grocery_sales.default.sales s
  JOIN grocery_sales.default.products p ON s.productid = p.productid
  WHERE s.salesdate IS NOT NULL
    AND s.salesdate < '2018-05-01'
  GROUP BY DATE_TRUNC('month', s.salesdate)
)
SELECT
    month, revenue, units_sold,
    LAG(revenue) OVER (ORDER BY month) AS prev_month_revenue,
    revenue - LAG(revenue) OVER (ORDER BY month) AS revenue_change,
    ROUND((revenue - LAG(revenue) OVER (ORDER BY month))
          / NULLIF(LAG(revenue) OVER (ORDER BY month), 0) * 100, 2) AS mom_growth_pct
FROM monthly