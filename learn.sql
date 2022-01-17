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
