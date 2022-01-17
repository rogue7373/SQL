CREATE TABLE Horse (
	ID              SMALLINT UNSIGNED AUTO_INCREMENT,
	RegisteredName  VARCHAR(15),
	PRIMARY KEY (ID)
);

CREATE TABLE Student (
	ID             SMALLINT UNSIGNED AUTO_INCREMENT,
	FirstName      VARCHAR(20),
	LastName 		VARCHAR(30),
	PRIMARY KEY (ID)
);

-- Your SQL statements go here 
CREATE TABLE LessonSchedule (
   HorseID        SMALLINT(5) UNSIGNED NOT NULL,
      CONSTRAINT fk_LessonSchedule_HorseID
      FOREIGN KEY (HorseID) REFERENCES Horse(ID)
         ON UPDATE RESTRICT
         ON DELETE CASCADE, 
   StudentID      SMALLINT(5) UNSIGNED,
      CONSTRAINT fk_LessonSchedule_StudentID
      FOREIGN KEY (StudentID) REFERENCES Student(ID)
         ON DELETE SET NULL
         ON UPDATE RESTRICT,
   LessonDateTime DATETIME NOT NULL,
   PRIMARY KEY (HorseID, LessonDateTime)
);


-- MIN/MAX, HAVING, Group By, Count(), SUM(), AVG(), etc.
CREATE TABLE Song (
  ID INT,
  Title VARCHAR(60),
  Artist VARCHAR(60),
  ReleaseYear INT,
  Genre VARCHAR(20),
  PRIMARY KEY (ID)
);

INSERT INTO Song VALUES
  (100, 'Hey Jude', 'Beatles', 1968, 'pop rock'),
  (200, 'You Belong With Me', 'Taylor Swift', 2008, 'country pop'),
  (300, 'You\'re Still the One', 'Shania Twain', 1998, 'country pop'),
  (400, 'Need You Now', 'Lady Antebellum', 2011, 'country pop'),
  (500, 'You\'ve Lost That Lovin\' Feeling', 'The Righteous Brothers', 1964, 'R&B'),
  (600, 'That\'s The Way Love Goes', 'Janet Jackson', 1993, 'R&B'),
  (700, 'Smells Like Teen Spirit', 'Nirvana', 1991, 'grunge'),
  (800, 'Even Flow', 'Pearl Jam', 1992, 'grunge'),
  (900, 'Black Hole Sun', 'Soundgarden', 1994, 'grunge');

-- Modify the SELECT statement
SELECT Genre, COUNT(*)
FROM Song
GROUP BY Genre;


-- Inner Join -- 
SELECT DepartmentName, EmployeeName
FROM Department -- Left Table
INNER JOIN Employee -- Right Table
ON Department.Manager = Employee.ID;

-- Full Join -- 
SELECT DepartmentName, EmployeeName
FROM Department 
FULL JOIN Employee 
ON Department.Manager = Employee.ID;

-- Right Join Example -- 
SELECT DepartmentName, EmployeeName
FROM Department
RIGHT JOIN Employee
ON Department.Manager = Employee.ID;

-- Left Join Example -- 
SELECT DepartmentName, EmployeeName
FROM Department
LEFT JOIN Employee
ON Departmnet.Manager = Employee.ID;

-- Equijoin compares columns of two tables with the = operator. Most joins are equijoins. --
SELECT Name, Address
FROM Buyer 
LEFT JOIN Property
ON Price = MaxPrice;


-- Non-Equijoin compares columns with an opeerator other than =, such as <, >.  --
SELECT Name, Address
FROM Buyer
LEFT JOIN Property
ON Price < MaxPrice;

-- Self Join Example --
SELECT A.Name, B.Name
FROM EmployeeManager A 
INNER JOIN EmployeeManager B 
ON B.ID = A.Manager;

-- Cross Join Example --
SELECT Model, Gigabytes, IPhone.Price + Memory.Price
FROM IPhone
CROSS JOIN Memory;

-- Working with Joins, this snippet you can change the SELECT Statement to LEFT, RIGHT, INNER, or CROSS JOINS to see the behavior -- 
CREATE TABLE Genre (
  Code CHAR(3),
  Name VARCHAR(20),
  Description VARCHAR(200),
  PRIMARY KEY(Code)
);

CREATE TABLE Song (
  ID INT,
  Title VARCHAR(60),
  Artist VARCHAR(60),
  Code CHAR(3),
  PRIMARY KEY (ID),
  FOREIGN KEY Song(Code) REFERENCES Genre(Code)
);

INSERT INTO Genre VALUES
  ('CLA', 'Classical', 'Orchestral music composed and performed by professionally trained artists'),
  ('COU', 'Country', 'Developed mostly in southern USA, with roots in traditional folk music, spirituals and blues'),
  ('DRO', 'Drone', 'Minimalist music that emphasizes sustained or repeated sounds, notes, or tone clusters'),
  ('GRU', 'Grunge', 'Alternative rock inspired by hardcore punk, heavy metal, and indie rock'),
  ('PRC', 'Pop Rock', 'Rock music with less attitude'),
  ('RAB', 'R&B', 'Modern version of soul and funk African-American pop music'),
  ('TEC', 'Techno', 'Electronic music');

INSERT INTO Song VALUES
  (100, 'Hey Jude', 'Beatles', 'PRC'),
  (200, 'You Belong With Me', 'Taylor Swift', NULL),
  (300, 'Need You Now', 'Lady Antebellum', 'COU'),
  (400, 'Old Town Road', 'Lil Nas X', NULL),
  (500, 'That\'s The Way Love Goes', 'Janet Jackson', 'RAB'),
  (600, 'Even Flow', 'Pearl Jam', 'GRU');


SELECT *
FROM Song
CROSS JOIN Genre
ON Song.Code = Genre.Code;



-- SELECT STATEMENT Practice Naming --
SELECT COllege.City, StateCode
FROM College, Location
WHERE College.City = Location.City;

