--1)Create a scalar procedure that takes date and returns Month name of that date.
 
create proc Get_month_name @date Date
as 
begin try
				 select DATENAME(MONTH, @date);
	end try

	begin catch
			select 'error try in correct format' as 'message'
	end catch 


Get_month_name '2024-01-22'
Get_month_name '22-01-2024'

--2)Create a multi-statements 
--table-valued function that takes 2 integers and returns the values between them.
create proc get_in_between @num1 int ,@num2 int 
as 
declare @in_between TABLE
(
    num3 INT
)
   
    DECLARE @num INT;
    SET @num = @num1;
    
  begin try  
    WHILE @num<= @num2
    BEGIN
        
        INSERT INTO @in_between (num3)
        VALUES (@num);
        
         
        SET @num = @num + 1;
    END;
	select * from @in_between
  end try
  begin catch 
  select 'Erorr try again' as 'Message'
  end catch

  get_in_between 30,356

/*3)Create inline function that takes 
Student No and returns Department Name 
with Student full name.*/

create proc D_S_N @id int
as 
(select   D.Dept_Name  ,concat(S.St_Fname,' ' ,S.St_Lname) as Fullname from dbo.Department  D
inner join dbo.Student S
ON  S.Dept_Id=D.Dept_Id
where S.St_Id=@id)

d_s_n 9

alter proc D_S_N @id int
as 
begin try 
(select   D.Dept_Name  ,concat(S.St_Fname,' ' ,S.St_Lname) as Fullname from dbo.Department  D
inner join dbo.Student S
ON  S.Dept_Id=D.Dept_Id
where S.St_Id=@id)
end try 
begin catch
select 'Erorr try agin  using correct data' as ' Message'

d_s_n 7


/*4) Create a scalar function that takes Student ID and returns a message to user 
a.	If first name and Last name are null then display 'First name & last name are null'
b.	If First name is null then display 'first name is null'
c.	If Last name is null then display 'last name is null'
d.	Else display 'First name & last name are not null'*/
create proc Message2 @id INT
AS
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
    Select  @Message  as 'Message'

message2 10

/*Create inline function that takes integer which represents
 manager ID and displays department name, Manager Name and hiring date*/

create proc Managerdetails1 @id INT
AS
(
     
    SELECT 
        D.Dept_Name,D.Dept_Manager,D.Manager_hiredate
    FROM dbo.Department D
    where D.Dept_Id=(select Dept_Id from dbo.Instructor i
	where i.Ins_Id=@id)
)
Managerdetails1 2





 