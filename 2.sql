use depi2
----------------
--
----------------------
----window functions
---- lead lag first value last value 
select s.st_id as ssid,St_Fname as sname , grade , crs_name as cname
into grades from Student s ,Stud_Course sc , Course c
where s.St_Id=sc.St_Id and c.crs_id=sc.Crs_Id
------------------------------------
------------------------------------
select * from grades

SELECT sname,grade,
v1=LAG(sname) over(order by grade),
v2=lead(sname) over(order  by grade)
from grades
select * from grades
SELECT sname,grade,cname,
v1=LAG(sname) over(partition by cname order by grade),
v2=lead(sname) over( partition by cname order  by grade)
from grades
where cname = 'OOP'
----------------
----------------
select sname,grade,

v1=LAG(sname) over(partition by cname order by grade),
v2=lead(sname) over(partition by cname order by grade),
first =FIRST_VALUE(sname) over (order by grade),
last  =LAST_VALUE(sname)   over (order by grade)
from grades

--------------------------------------------------------------