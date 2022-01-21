CREATE TABLE Album (
  ID INT,
  Title VARCHAR(60),
  ReleaseYear INT,
  PRIMARY KEY (ID)
);

INSERT INTO Album VALUES
  (1, 'Saturday Night Fever', 1977),
  (2, 'Born in the U.S.A.', 1984),
  (3, 'Supernatural', 1999),
  (4, '21', 2011);

CREATE TABLE Song (
  ID INT,
  Title VARCHAR(60),
  Artist VARCHAR(60),
  AlbumID INT,
  PRIMARY KEY (ID),
  FOREIGN KEY (AlbumID) REFERENCES Album(ID)
);

INSERT INTO Song VALUES
  (100, 'Stayin\' Alive', 'Bee Gees', 1),
  (101, 'More Than a Woman', 'Bee Gees', 1),
  (102, 'If I Can\'t Have You', 'Yvonne Elliman', 1),
  (200, 'Dancing in the Dark', 'Bruce Springsteen', 2),
  (201, 'Glory Days', 'Bruce Springsteen', 2),
  (300, 'Smooth', 'Santana', 3),
  (400, 'Rolling in the Deep', 'Adele', 4),
  (401, 'Someone Like You', 'Adele', 4),
  (402, 'Set Fire to the Rain', 'Adele', 4),
  (403, 'Rumor Has It', 'Adele', 4);

SELECT *
FROM Album
WHERE EXISTS 
  (SELECT COUNT(*)
   FROM Song
   WHERE AlbumID = Album.ID 
   GROUP BY AlbumID
   HAVING COUNT(*) >=3);

------ Example ------
-- Table 1 - Course
CourseId	CourseCode	CourseName	Capacity	InstructorId
1276	BIOL39	Immunology	200	1
8687	PHIL938	Formal Logic	75	2
6869	BIOL344	Animal Behavior	25	1
3238	HIST378	World History	150	3
3155	PHIL569	Critical Thinking	100	2

Table 2 - Instructor
InstructorId	InstructorName	Rank	Department
1	Dan Fry	Assistant Professor	Biology
2	Eli Webb	Professor	Philosophy
3	Gus Tran	Assistant Professor	History 

-- Select Statement --
SELECT CourseName
FROM Course
WHERE InstructorId = 
   (SELECT InstructorId
   FROM Instructor
   WHERE InstructorName = 'Eli Webb');
