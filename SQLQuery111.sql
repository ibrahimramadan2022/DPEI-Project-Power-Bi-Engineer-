use Student
 --Create a scalar function that takes date and returns Month name of that date.
 
CREATE FUNCTION month_name (@date DATE)
RETURNS VARCHAR(20)
AS
BEGIN
   
    RETURN DATENAME(MONTH, @date);
END;

select dbo.month_name('2024-05-22')  as 'Month Name'


-- Create a multi-statements table-valued function that takes 2 integers and returns the values between them.
CREATE FUNCTION Values_Between(@num1 INT,@num2 INT)
RETURNS @in_between TABLE
(
    num3 INT
)
AS
BEGIN
   
    DECLARE @num INT;
    SET @num = @num1;
    
    
    WHILE @num<= @num2
    BEGIN
        
        INSERT INTO @in_between (num3)
        VALUES (@num);
        
         
        SET @num = @num + 1;
    END;
    RETURN;
END;
select num3 as 'in between values' from  dbo.values_between(20,50)  
--Create inline function that takes 
--Student No and returns Department Name with Student full name.
--( using Inner join)
 
create function  DepartmentAndStudentName(@id int)
returns table 
return(select Dept_Name,concat(St_Fname,'  ' ,St_Lname) as FullName from dbo.Student
inner join dbo.Department D ON  St_Id=D.Dept_Id
where St_Id=@id )

select * from DepartmentAndStudentName(2)

-- Using (left join)
create function  DepartmentAndStudentName1(@id int)
returns table 
return(select Dept_Name,concat(St_Fname,'  ' ,St_Lname) as FullName from dbo.Student
left join dbo.Department D ON  St_Id=D.Dept_Id
where St_Id=@id )

select * from DepartmentAndStudentName1(2)

--Using Right join
create function  DepartmentAndStudentName2(@id int)
returns table 
return(select Dept_Name,concat(St_Fname,'  ' ,St_Lname) as FullName from dbo.Student
Right join dbo.Department D ON  St_Id=D.Dept_Id
where St_Id=@id )

select * from DepartmentAndStudentName2(2)

/*Create a scalar function that takes Student ID and returns a message to user 
a.	If first name and Last name are null then display 'First name & last name are null'
b.	If First name is null then display 'first name is null'
c.	If Last name is null then display 'last name is null'
d.	Else display 'First name & last name are not null'*/
CREATE FUNCTION Message1(@id INT)
RETURNS VARCHAR(100)
AS
BEGIN
    DECLARE @Firstname VARCHAR(30);
    DECLARE @Lastname VARCHAR(20);
    DECLARE @Message VARCHAR(100);

    
    SELECT @Firstname =St_Fname, @Lastname = St_Lname from dbo.Student

    WHERE St_Id = @id;
    SET @Message = 
        CASE 
            WHEN @FirstName IS NULL AND @LastName IS NULL THEN 'First name & last name are null'
            WHEN @FirstName IS NULL THEN 'First name is null'
            WHEN @LastName IS NULL THEN 'Last name is null'
            ELSE 'First name & last name are not null'
        END;
    RETURN @Message;
END;

select dbo.Message1(9) as 'Message'
 


 --Create inline function that takes integer which represents
 --manager ID and displays department name, Manager Name and hiring date 
 select * from dbo.Department
 select * from dbo.Instructor

CREATE FUNCTION Managerdetails(@id INT)
RETURNS TABLE
AS
RETURN
(
     
    SELECT 
        D.Dept_Name,D.Dept_Manager,D.Manager_hiredate
    FROM dbo.Department D
    where D.Dept_Id=(select Dept_Id from dbo.Instructor i
	where i.Ins_Id=@id)
);
select * from dbo.Managerdetails(2)


