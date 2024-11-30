use DEPI2

create view v_student 
as
select * from Student

select * from v_student


alter view vcairo (sid,sname,sadd) 

as

select st_id , St_Fname ,st_address
from Student
where St_Address = 'cairo'


select * from vcairo

select sname from vcairo


create view valex (sid,sname,sadd) 

as

select st_id , St_Fname ,st_address
from Student
where St_Address = 'alex'


select * from valex


create view vax 
as 

select * from vcairo 
union all 
select * from valex


Select * from hr.vax

-- to create Schema ---->  use Create schema [name of scema]----------
alter schema hr transfer vax

create view st_dept(sidd,ssname,d_id,dd_name)

as

select s.st_id , s.st_fname,d.dept_id ,d.dept_name
from department d inner join student s 
on d.dept_id=s.dept_id


select *from st_dept

