use Company_SD
 
--1)
------)a
select * from dbo.Employee
select * from dbo.Dependent
select Dependent.Dependent_name,Dependent.Sex from dbo.Dependent
inner join Employee on Dependent.ESSN=Employee.SSN
where Dependent.Sex='F' and Employee.Sex='F'

------)b
SELECT Dependent.Dependent_name, Dependent.Sex
FROM Dependent
INNER JOIN Employee ON Dependent.ESSN = Employee.SSN
WHERE Dependent.Sex = 'M' AND Employee.Sex = 'M';


--2)
select * from dbo.Project
select * from dbo.Works_for
select Pname ,sum(Hours) as "Total Hours per week" 
from dbo.Project
inner join dbo.Works_for on Works_for.Pno=Project.Pnumber
group by Pname 


--3)
select * from dbo.Departments
--with inner join
select  * from dbo.Departments
inner join dbo.Employee on Employee.SSN=Departments.MGRSSN
where Employee.SSN<=(select min(SSN) from dbo.Employee)

--without inner join
select * from dbo.Departments 
where Departments.MGRSSN<= (select min(SSN) from dbo.Employee)


--4)
select Departments.Dname ,max(Employee.Salary) as "Max Salary",
min(Employee.Salary) as "Min Salary",avg(Employee.Salary)  as " Avrage Salary"
from dbo.Departments
inner join Employee on Employee.SSN=Departments.MGRSSN
group by Departments.Dname

--5) SSN for Mangers
select Departments.MGRSSN from dbo.Departments
join Employee on Departments.MGRSSN=Employee.SSN 


select CONCAT(Employee.Lname, ', ', Employee.Fname) AS FullName from dbo.Employee
where Employee.SSN in (
select Departments.MGRSSN from dbo.Departments
join Employee on Departments.MGRSSN=Employee.SSN )
and  Dno is NULL


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

select salary,SSN from dbo.Employee
order by Salary desc


WITH RankedEmployees AS (
    SELECT
        SSN,
        Salary,
        RANK() OVER (ORDER BY Salary DESC) AS SalaryRank
    FROM
        Employee
)
SELECT
   
    Salary
FROM
    RankedEmployees
WHERE
    SalaryRank <= 2;


--9)
select CONCAT(Fname ,' ', Lname ) as FULLName from dbo.Employee
where CONCAT(Fname ,' ', Lname ) in
(select Dependent.Dependent_name from dbo.Dependent)

--10)
SELECT Employee.SSN, CONCAT(Employee.Lname, ', ', Employee.Fname) AS FullName
FROM Employee
WHERE EXISTS (
    SELECT 1
    FROM Dependent
    WHERE Dependent.ESSN = Employee.SSN
);