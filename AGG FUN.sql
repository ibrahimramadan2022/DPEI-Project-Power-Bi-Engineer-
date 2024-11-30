USE DEPI2
-------
-- SQL AGG FUNCTIONS
--------
select * from student
select salary from Instructor

select sum(salary) from Instructor 

select max(salary) , min(salary)
from Instructor

select count(*) , count(st_id),count(st_lname),count(st_age)
from Student

select avg(isnull(st_age,0))
from Student

select sum(st_age)/count(*)
from Student

select sum(salary) , d.dept_id ,dept_name
from instructor i inner join Department d on d.Dept_id=i.dept_id
group by d.dept_id ,d.dept_name

select AVG(st_age), St_Address , dept_id 
from student 
group by Dept_Id,st_address

select AVG(st_age),St_Id
from Student 
group by St_Id

select st_age

from Student

select sum(salary),dept_id
from Instructor
group by dept_id

select sum(salary) ,dept_id
from Instructor
group by Dept_Id
having sum(salary)>13000


select sum(salary),dept_id
from Instructor
where Salary>1000
group by dept_id


---------------
--SUBQUERIES
-- 
SELECT * 
FROM Instructor
WHERE SALARY > 6700


SELECT * 
FROM Instructor
WHERE SALARY >  (SELECT AVG(SALARY) FROM Instructor)



SELECT *,(SELECT  COUNT(ST_ID) FROM Student) AS 'NO OF ST'
FROM Student


SELECT DEPT_NAME FROM Department 

SELECT * FROM Student
SELECT Dept_Name FROM Department 
WHERE DEPT_ID  IN ( SELECT DISTINCT(DEPT_ID)FROM
                      STUDENT WHERE DEPT_ID IS NOT NULL)