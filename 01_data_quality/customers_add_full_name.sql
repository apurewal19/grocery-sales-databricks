-- Add a full_name column to customers
-- Purpose: show a readable customer name in dashboards (e.g. Top Customers) instead of first name only, which many customers share.

-- 1) Add an empty column to the existing table (keeps primary/foreign keys intact)
ALTER TABLE grocery_sales.default.customers ADD COLUMN full_name STRING;

-- 2) Fill it by joining first and last name with a space
--    CONCAT_WS skips NULLs, so a missing last name won't make the whole value NULL
UPDATE grocery_sales.default.customers
SET full_name = CONCAT_WS(' ', firstname, lastname);

-- 3) Check the result (preview only; does not change any data)
SELECT customerid, firstname, lastname, full_name
FROM grocery_sales.default.customers
LIMIT 10;