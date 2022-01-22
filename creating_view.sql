# SQL

-- Example of Creating a View of Table in MySQL --
CREATE VIEW ViewName [ ( Column1, Column2, ...) ]
AS SelectStatement;

-- Example of Full View Statement --
CREATE VIEW ManagerView 
AS SELECT DepartmentName, EmployeeName AS ManagerName
    FROM Department, Employee
    WHERE ManagerID = EmployeeID;

-- Example of View --
CREATE VIEW ViewName [ ( Column1, Column2, ...)]
AS SelectStatement
[   WITH CHECK OPTION ];
