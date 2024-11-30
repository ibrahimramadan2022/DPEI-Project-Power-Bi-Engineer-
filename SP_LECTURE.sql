-- first Type ----> built in SP
-- Third type tirgger 

----Secound type User defined SP 

use depi2


select * from Student


create proc Get_st 
as 
	Select * from Student 

get_st

execute Get_st
-------------------------------------
create proc gth @add varchar(50)
as
		select st_id , st_fname , st_address 
		from Student 
		where St_Address=@add

gth 'cairo'

insert into Student (st_id , st_fname)
values (22,'noha')


delete from Student 
where st_id = 1

alter proc erin @id int , @name varchar(40)

as
	begin try
				insert into Student (st_id , st_fname)
				values (@id,@name)
	end try

	begin catch
			select 'error' as 'message'
	end catch 
--call
	erin 29,'said'
	erin 21,'ahmed'

alter proc sumn  @x int =106, @y int = 104

as

		select @x+@y


---call Types 

sumn 3,9 -----> calling parameter by positons 

sumn @y=12 ,@x=8   ----> calling Parameter by Name


sumn 

---------

create table t_student (ts_id int primary key ,ts_name varchar(60))

--------------


alter proc gt_st_age @age1 int , @age2 int 

as
		select st_id as ' id' , St_Fname 'student first name'
		from Student
		where St_Age between @age1 and @age2
----
select * from t_student
--call
		gt_st_age  20 ,30

------------------------
----insert based on execute -----

--------------------
truncate table t_student (ts_id int primary key ,ts_name varchar(60))
--------------------------

		insert into t_student
		execute gt_st_age 20,30

--------
select * from ahmed


insert into ahmed (ssid,sname)
execute gt_st_age 20,30

declare @table table ( sd_id int , sd_name Varchar(40))
insert into @table 
execute gt_st_age 20,30

select Count(*) as ' # of student ' from @table 


------------------------------



Alter PROC GT_DATA @ID INT , @age int output , @name varchar(60) output
AS
			
			SELECT @AGE=ST_AGE ,@name=St_Fname
			FROM Student
			WHERE ST_ID = @ID

		

--CALL

declare @x int ,@y varchar(60)
execute GT_DATA 7 , @x output , @y output
select @x , @y
-------------------------------------------------