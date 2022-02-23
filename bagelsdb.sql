CREATE TABLE BagelsDB (
    BagelOrderID INT,
    BagelID INT,
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


-- 2NF Table --
-- Need to add a PK and FK -- 
CREATE TABLE BagelID (
    BagelID INT UNSIGNED NOT NULL,
    BagelName VARCHAR(20),
    BagelDescription VARCHAR(50),
    PRIMARY KEY (BagelName),
    FOREIGN KEY (BagelID) REFERENCES BagelsDB (BagelID)
);

INSERT INTO BagelID VALUES ('1','DF', 'Tasty'),
('2','RF', 'Super Tasty');

