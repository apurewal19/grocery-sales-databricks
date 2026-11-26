-- Schema constraints for the grocery_sales star schema.

-- 1) Primary key columns must be NOT NULL
ALTER TABLE grocery_sales.default.categories ALTER COLUMN categoryid SET NOT NULL;
ALTER TABLE grocery_sales.default.countries  ALTER COLUMN countryid  SET NOT NULL;
ALTER TABLE grocery_sales.default.cities     ALTER COLUMN cityid     SET NOT NULL;
ALTER TABLE grocery_sales.default.customers  ALTER COLUMN customerid SET NOT NULL;
ALTER TABLE grocery_sales.default.employees  ALTER COLUMN employeeid SET NOT NULL;
ALTER TABLE grocery_sales.default.products   ALTER COLUMN productid  SET NOT NULL;
ALTER TABLE grocery_sales.default.sales      ALTER COLUMN salesid    SET NOT NULL;

-- 2) Primary keys
ALTER TABLE grocery_sales.default.categories ADD CONSTRAINT pk_categories PRIMARY KEY (categoryid);
ALTER TABLE grocery_sales.default.countries  ADD CONSTRAINT pk_countries  PRIMARY KEY (countryid);
ALTER TABLE grocery_sales.default.cities     ADD CONSTRAINT pk_cities     PRIMARY KEY (cityid);
ALTER TABLE grocery_sales.default.customers  ADD CONSTRAINT pk_customers  PRIMARY KEY (customerid);
ALTER TABLE grocery_sales.default.employees  ADD CONSTRAINT pk_employees  PRIMARY KEY (employeeid);
ALTER TABLE grocery_sales.default.products   ADD CONSTRAINT pk_products   PRIMARY KEY (productid);
ALTER TABLE grocery_sales.default.sales      ADD CONSTRAINT pk_sales      PRIMARY KEY (salesid);

-- 3) Foreign keys
ALTER TABLE grocery_sales.default.cities
  ADD CONSTRAINT fk_cities_country FOREIGN KEY (countryid)
  REFERENCES grocery_sales.default.countries (countryid);

ALTER TABLE grocery_sales.default.customers
  ADD CONSTRAINT fk_customers_city FOREIGN KEY (cityid)
  REFERENCES grocery_sales.default.cities (cityid);

ALTER TABLE grocery_sales.default.employees
  ADD CONSTRAINT fk_employees_city FOREIGN KEY (cityid)
  REFERENCES grocery_sales.default.cities (cityid);

ALTER TABLE grocery_sales.default.products
  ADD CONSTRAINT fk_products_category FOREIGN KEY (categoryid)
  REFERENCES grocery_sales.default.categories (categoryid);

ALTER TABLE grocery_sales.default.sales
  ADD CONSTRAINT fk_sales_employee FOREIGN KEY (salespersonid)
  REFERENCES grocery_sales.default.employees (employeeid);

ALTER TABLE grocery_sales.default.sales
  ADD CONSTRAINT fk_sales_customer FOREIGN KEY (customerid)
  REFERENCES grocery_sales.default.customers (customerid);

ALTER TABLE grocery_sales.default.sales
  ADD CONSTRAINT fk_sales_product FOREIGN KEY (productid)
  REFERENCES grocery_sales.default.products (productid);