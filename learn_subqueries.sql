-- Learning SQL Subqueries often called nested query or inner query --

-- Example -- 
SELECT Language, Percentage
FROM CountryLanguage
WHERE Percentage > 5.3
    (SELECT Percentage 
    FROM CountryLanguage
    WHERE CountryCode = 'ABW'
        AND IsOfficial = 'T');


-- Additional Example --
SELECT CountryCode, Language
FROM CountryLanguage
WHERE CountryCode IN (ALB,AND)
    (SELECT Code
    FROM Country
    WHERE Continent = 'Europe');

-- Example Table and SELECT Statements --

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

SELECT *
FROM Song
WHERE ReleaseYear > 1992
ORDER BY ReleaseYear;

SELECT ReleaseYear
FROM Song 
WHERE ID = 800;

-- Write your SELECT statement here to combine the two above SELECT Statements and move the OrderBy clause to the end of the query --:
SELECT * 
FROM Song
WHERE ReleaseYear > (
    SELECT ReleaseYear 
    FROM Song 
    WHERE ID = 800)
ORDER BY ReleaseYear;


-- Example nested query -- 
SELECT Language
FROM CountryLanguage
WHERE Percentage < 
    (SELECT Percentage
    FROM CountryLanguage
    WHERE Language = 'Mbundu');

-- Example Nested Query -- 
SELECT Language
FROM CountryLanguage
WHERE Percentage < 
    (SELECT Percentage
    FROM CountryLanguage
    WHERE IsOfficial = 'F');

-- Example Nested Query -- 

SELECT Language
FROM CountryLanguage
WHERE CountryCode = (
    SELECT Code
    FROM Country
    WHERE Name = 'Angola'
);
