--1)
use Company_SD
SELECT Dependent.Dependent_name, Dependent.Sex
FROM Dependent
INNER JOIN Employee ON Dependent.ESSN = Employee.SSN
WHERE Dependent.Sex = 'F' AND Employee.Sex = 'F'


SELECT Dependent.Dependent_name, Dependent.Sex
FROM Dependent
INNER JOIN Employee ON Dependent.ESSN = Employee.SSN
WHERE Dependent.Sex = 'M' AND Employee.Sex = 'M';






--2

SELECT Project.Pname, SUM(Works_for.Hours) AS TotalHoursPerWeek
FROM Works_for
INNER JOIN Project ON Works_for.Pno = Project.Pnumber
GROUP BY Project.Pname;


--3)
SELECT Departments.*
FROM Departments
INNER JOIN Employee ON Departments.MGRSSN = Employee.SSN
WHERE Employee.SSN = (SELECT MIN(SSN) FROM Employee);



--4)

SELECT Departments.Dname, MAX(Employee.Salary), MIN(Employee.Salary), AVG(Employee.Salary)
FROM Departments
INNER JOIN Employee ON Departments.MGRSSN = Employee.SSN
GROUP BY Departments.Dname;


--5)
SELECT CONCAT(Employee.Lname, ', ', Employee.Fname) AS FullName
FROM Employee
LEFT JOIN Dependent ON Employee.SSN = Dependent.ESSN
WHERE Dependent.ESSN IS NULL;



--6)
SELECT Departments.MGRSSN, Departments.Dname, COUNT(*) AS NumEmployees
FROM Departments
INNER JOIN Employee ON Departments.MGRSSN = Employee.SSN
GROUP BY Departments.MGRSSN, Departments.Dname
HAVING AVG(Employee.Salary) < (SELECT AVG(Salary) FROM Employee);

--7)
SELECT Employee.Lname, Employee.Fname, Project.Pname
FROM Employee
INNER JOIN Works_for ON Employee.SSN = Works_for.ESSN
INNER JOIN Project ON Works_for.Pno = Project.Pnumber
ORDER BY Employee.SSN, Employee.Lname, Employee.Fname;


--8)

SELECT TOP 2 Salary
FROM Employee
ORDER BY Salary DESC

--9)

SELECT CONCAT(Employee.Lname, ', ', Employee.Fname) AS FullName
FROM Employee
WHERE EXISTS (
    SELECT 1
    FROM Dependent
    WHERE SOUNDEX(Dependent.Dependent_name) = SOUNDEX(CONCAT(Employee.Lname, Employee.Fname))
);

--10)
SELECT Employee.SSN, CONCAT(Employee.Lname, ', ', Employee.Fname) AS FullName
FROM Employee
WHERE EXISTS (
    SELECT 1
    FROM Dependent
    WHERE Dependent.ESSN = Employee.SSN
);