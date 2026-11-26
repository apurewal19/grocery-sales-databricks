-- replaced products.price (double) to products.price (decimal(10,2))

CREATE OR REPLACE TABLE grocery_sales.default.products AS
SELECT productid, productname, CAST(price AS DECIMAL(10,2)) AS price, categoryid
FROM grocery_sales.default.products;

-- describes the table and its types
DESCRIBE TABLE grocery_sales.default.products;

-- counts the number of rows
SELECT COUNT(*) as count FROM grocery_sales.default.products;