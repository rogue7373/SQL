-- Performance Objective: 1 --
-- Createing Table for Bagels DB --

CREATE TABLE BagelsDB (
    BagelOrderID INT UNSIGNED NOT NULL AUTO_INCREMENT,
    BagelID INT UNSIGNED NOT NULL, 
    OrderDate DATETIME,
    FirstName VARCHAR(20),
    LastName VARCHAR(20),
    Address1 VARCHAR(20),
    Address2 VARCHAR(20),
    City VARCHAR(20),
    State VARCHAR(20),
    Zip VARCHAR(20),
    MobilePhone VARCHAR(20),
    DeliveryFree VARCHAR(20),
    BagelName VARCHAR(20),
    BagelDescription VARCHAR(50),
    BagelPrice VARCHAR(20),
    BagelQuantity VARCHAR(20),
    SpecialNotes VARCHAR(80),
    PRIMARY KEY (BagelOrderID, BagelID)
);

-- Pushing Data to the BagelsDB Table --
INSERT INTO BagelsDB VALUES (1, 1, '2020-01-01', 'John', 'Smith', '123 Main St', '', 'San Francisco', 'CA', '94123', '555-555-5555', 'Yes', 'Bagel', 'Bagel Description', '$1.00', '1', 'Special Notes');
INSERT INTO BagelsDB VALUES (2, 2, '2020-01-01', 'John', 'Smith', '123 Main St', '', 'San Francisco', 'CA', '94123', '555-555-5555', 'Yes', 'Bagel', 'Bagel Description', '$1.00', '1', 'Special Notes');
-- Change Table Name 
ALTER TABLE BagelsDB
RENAME TO BagelOrderLineItem;

-- Table Normalization --
ALTER TABLE BagelOrderLineItem
DROP COLUMN BagelID;

-- 2NF Table --
-- Need to add a PK and FK -- 
CREATE TABLE BagelID (
    BagelID INT UNSIGNED NOT NULL,
    PRIMARY KEY (BagelID),
    FOREIGN KEY (BagelID) REFERENCES BagelOrderLineItem(BagelID)
         ON UPDATE RESTRICT
         ON DELETE CASCADE, 
);

-- BagelID Data --
INSERT INTO BagelID VALUES 
('Foo')),
('Foo2'),
('Foo3'),
('Foo4'),
('Foo5');
