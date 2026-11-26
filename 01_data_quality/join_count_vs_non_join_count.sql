-- check to see if sales_rows are equal to joined_rows

SELECT
    (SELECT COUNT(*) FROM grocery_sales.default.sales) AS sales_rows,
    (SELECT COUNT(*) FROM grocery_sales.default.sales s 
        JOIN grocery_sales.default.products p
            ON s.productid = p.productid) AS joined_rows;