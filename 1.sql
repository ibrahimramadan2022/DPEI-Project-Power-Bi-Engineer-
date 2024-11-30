USE DEPI2

-------
CREATE FUNCTION ST_FIRSTNAME(@SSID INT) 
RETURNS VARCHAR(50)
BEGIN 
DECLARE @stname VARCHAR(60)
SELECT @STNAME = st_fname FROM STUDENT 
WHERE st_id=@SSID
return @stname
END 


select dbo.st_firstname(5)

-----

--- take dept_number return name + annul salary


create function dpinfo(@ddid int)
returns table 
as
return 
(
select ins_name,salary*12 as 'totalsalary' 
from instructor
where dept_id=@ddid
)

select * from dpinfo(10)
select ins_name from dpinfo(10)
where totalsalary > 40000
select sum( totalsalary) from dpinfo(10)
-------------
-------------
-----multistatment function ----------
create function namest(@word varchar(70))
returns @tsname table 
		(
		stt_id int,
		name_st varchar(80)
		)
as
	begin
		if @word ='First'
		insert into @tsname
		select st_id , st_fname from student
		else if @word ='last'
		insert into @tsname
		select st_id , st_lname from student
		else if @word ='Full'
		insert into @tsname
		select st_id , st_fname+' '+st_lname as ' full name' from student
		
	  return
	end


select * from namest('First')
select * from namest('last')
select * from namest('Full')
select * from instructor
----------------------
----window functions
---- lead lag first value last value 