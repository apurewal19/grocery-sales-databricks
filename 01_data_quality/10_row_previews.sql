-- Sanity check: 10-row preview of every table in grocery_sales.default

SELECT * FROM grocery_sales.default.categories LIMIT 10;

SELECT * FROM grocery_sales.default.cities LIMIT 10;

SELECT * FROM grocery_sales.default.countries LIMIT 10;

SELECT * FROM grocery_sales.default.customers LIMIT 10;

SELECT * FROM grocery_sales.default.employees LIMIT 10;

SELECT * FROM grocery_sales.default.products LIMIT 10;

SELECT * FROM grocery_sales.default.sales LIMIT 10;