-- Create table for Employee -- 

CREATE TABLE Employee (
  employee_id	INT,
  first_name	VARCHAR(30),
  last_name		VARCHAR(30),
  hire_date		DATE,
  job_title		VARCHAR(30),
  shop_id		INT,
  PRIMARY KEY (employee_id)
 );

-- Added Data to the Employee Table --
 
 INSERT INTO Employee(employee_id, first_name, last_name, hire_date, job_title, shop_id)
VALUES 
	(1, 'John', 'Travolta', '1962-01-05', 'Owner', 9001),
	(2, 'Samual', 'Jackson', '1969-05-12', 'Manager', 9002),
	(3, 'David', 'Hassellhoff', '1955-07-22', 'Temp', 9003);

-- Create Table for Coffee_Shop --

CREATE TABLE Coffee_Shop (
    shop_id 	INT,
    shop_name 	VARCHAR(50),
    city 		VARCHAR(50),
    state 		CHAR(2),
    PRIMARY KEY (shop_id)
);

-- Added Data to the Coffee_Shop Table -- 

INSERT INTO Coffee_Shop(shop_id, shop_name, city, state)
VALUES 
	(9001, 'Caffeine Express', 'Draper', 'UT'),
	(9002, 'StarBoys', 'Seattle', 'WA'),
	(9003, 'CoffeeExpress', 'Salt Lake City', 'UT');

-- Create Coffee Table -- 

CREATE TABLE Coffee (
    coffee_id 			INT,
    shop_id 			INT,
    supplier_id 		INT,
    coffee_name 		VARCHAR(30),
    price_per_pound 	NUMERIC(5,2),
    PRIMARY KEY (coffee_id)
);

-- Added data to the Cofee table -- 

INSERT INTO Coffee(coffee_id, shop_id, supplier_id, coffee_name, price_per_pound)
VALUES 
	(2001, 9001, 8, 'Mocha', '5.99'),
	(3001, 9002, 9, 'Americano', '6.99'),
	(4001, 9003, 7, 'PineappleExpress', '29.99');
    
-- Create table for the Suppliers -- 
CREATE TABLE Supplier (
    supplier_id INT,
    company_name VARCHAR(50),
    country VARCHAR(30),
    sales_contact_name VARCHAR(60),
    email VARCHAR(50),
    PRIMARY KEY (supplier_id)
);

-- Added data to the Supplier table -- 
INSERT INTO Supplier(supplier_id, company_name, country, sales_contact_name, email)
VALUES (8, 'MadHatter', 'USA', 'Tony Stark', 'tony.stark@email.com'),
(9, 'StarStruck', 'USA', 'Steve Rogers', 'steve.rogers@email.com'),
(7, 'StarBoy', 'Guam', 'Bruce Banner', 'brucebanner@gmail.com');

--Add FK's to tables -- 

ALTER TABLE Employee ADD FOREIGN KEY (shop_id) REFERENCES Coffee_Shop(shop_id);
ALTER TABLE Coffee ADD FOREIGN KEY (shop_id) REFERENCES Coffee_Shop(shop_id);
ALTER TABLE Coffee ADD FOREIGN KEY (supplier_id) REFERENCES Supplier(supplier_id)

-- Create a View --

CREATE VIEW EmployeeView AS 
    SELECT 
        employee_id,
        CONCAT (first_name,
        last_name) AS employee_full_name,
        hire_date,
        job_title,
        shop_id
    FROM 
        Employee
    
-- SELECT Statement showing view -- 

SELECT * FROM EmployeeView

-- Create an Index -- 
CREATE INDEX coffe_name ON Coffee (coffee_name);


-- SELECT STATEMENTS WITH INNER JOIN --

SELECT Employee.employee_id, Employee.first_name, Employee.last_name, Coffee_Shop.city, Coffee_Shop.shop_name, Coffee.coffee_name
FROM ((Employee
INNER JOIN Coffee_Shop ON Employee.shop_id = Coffee_Shop.shop_id)
INNER JOIN Supplier ON Coffee.supplier_id = Supplier.supplier_id);


SELECT * 
FROM Employee, Coffee_Shop, Coffee, Supplier


SELECT * 
FROM Coffee 
WHERE coffee_name = 'Mocha';


SELECT Employee.employee_id, Employee.first_name, Employee.last_name, Coffee_Shop.city, Coffee_Shop.shop_name, Coffee.coffee_name
FROM ((Employee
INNER JOIN Coffee_Shop ON Employee.shop_id = Coffee_Shop.shop_id)
INNER JOIN Coffee ON Coffee_Shop.shop_id = Coffee.shop_id);