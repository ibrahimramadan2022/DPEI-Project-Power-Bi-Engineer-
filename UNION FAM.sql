---SUBQUERY + DML 
--- DML ---- UPDATE INSERT DELETE

DELETE FROM Stud_Course
where St_Id = 1
select * from stud_course

delete  from
Stud_Course where
st_id in 
(select st_id from student where st_address  = 'cairo')


--union family
union all 

select st_fname 
from Student
union all
select ins_name 
from instructor 

select st_fname 
from Student
union 
select ins_name 
from instructor

select st_fname 
from Student
except
select ins_name 
from instructor 


select st_fname 
from Student
intersect 
select ins_name 
from instructor 

-----