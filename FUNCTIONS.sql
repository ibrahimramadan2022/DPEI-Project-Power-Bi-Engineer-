--var 
declare @xm int 
set @xm = 15

select @xm

declare @xm int = (select AVG(st_age) from student )
select @xm


declare @cc=

int  , @bn  varchar(50)
select @cc= St_Age , @bn = st_fname from Student where  st_id = 4
select @cc ,@bn



---- 
--BULIT FUNCTIONS
SELECT GETDATE()

SELECT ISNULL(ST_FNAME,'MO') FROM STUDENT 
SELECT MIN(SALARY),MAX(SALARY),AVG(SALARY)
FROM Instructor
----
----


--CREATE FUNCTIONS
CREATE function DEPIPOWER(@ID INT )
RETURNS VARCHAR(100)
Begin 
declare @name varchar(70)
select @name = St_Fname from Student where St_Id = @id
return @name
end

SELECT DBO.DEPIPOWER(1)








