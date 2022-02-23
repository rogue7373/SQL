CREATE TABLE Employee (
  employee_id	INT,
  first_name	VARCHAR(30),
  last_name		VARCHAR(30),
  hire_date		DATE,
  job_title		VARCHAR(30),
  shop_id		INT,
  PRIMARY KEY (employee_id)
 );

CREATE TABLE Coffee_Shop (
    shop_id 	INT,
    shop_name 	VARCHAR(50),
    city 		VARCHAR(50),
    state 		CHAR(2),
    PRIMARY KEY (shop_id)
);
CREATE TABLE Coffee (
    coffee_id 			INT,
    shop_id 			INT,
    supplier_id 		INT,
    coffee_name 		VARCHAR(30),
    price_per_pound 	NUMERIC(5,2),
    PRIMARY KEY (coffee_id)
);

CREATE TABLE Supplier (
    supplier_id INT,
    company_name VARCHAR(50),
    country VARCHAR(30),
    sales_contact_name VARCHAR(60),
    email VARCHAR(50),
    PRIMARY KEY (supplier_id)
);

ALTER TABLE Employee ADD FOREIGN KEY (shop_id) REFERENCES Coffee_Shop(shop_id);
ALTER TABLE Coffee ADD FOREIGN KEY (shop_id) REFERENCES Coffee_Shop(shop_id);
ALTER TABLE Coffee ADD FOREIGN KEY (supplier_id) REFERENCES Supplier(supplier_id);

INSERT INTO Supplier(supplier_id, company_name, country, sales_contact_name, email)
VALUES (1001, 'MadHatter', 'USA', 'Tony Stark', 'tony.stark@email.com'),
(1002, 'StarStruck', 'USA', 'Steve Rogers', 'steve.rogers@email.com'),
(1003, 'StarBoy', 'Guam', 'Bruce Banner', 'brucebanner@gmail.com');

INSERT INTO Coffee(coffee_id,coffee_name, price_per_pound)
VALUES (2001, 'Mocha', '5.99'),
(3001, 'Americano', '6.99'),
(4001, 'PineappleExpress', '29.99');

INSERT INTO Coffee_Shop(shop_id, shop_name, city, state)
VALUES (2001, 'Caffeine Express', 'Draper', 'UT'),
(3001, 'StarBoys', 'Seattle', 'WA'),
(4001, 'CoffeeExpress', 'Salt Lake City', 'UT');

INSERT INTO Employee(employee_id, first_name, last_name, hire_date, job_title)
VALUES (1, 'John', 'Travolta', '1962-01-05', 'Owner'),
(2, 'Samual', 'Jackson', '1969-05-12', 'Manager'),
(3, 'David', 'Hassellhoff', '1955-07-22', 'Temp');

CREATE VIEW 

CREATE INDEX 
