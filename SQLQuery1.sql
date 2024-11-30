/*1.	Display (Using Union Function)
a.	 The name and the gender of the dependence that's gender is
Female and depending on Female Employee.
b.	 And the male dependence that depends on Male Employee.
*/
--1) a 
select * from dbo.Dependent
select * from dbo.Employee
select [Dependent_name],[Sex] from dbo.Dependent
where [Dependent].Sex='F' and 
Sex in (select Sex from dbo.Employee
where Employee.Sex='F');
--1 ) b 
select [Dependent_name],[Sex] from dbo.Dependent
where [Dependent].Sex='M' and 
Sex in (select Sex from dbo.Employee
where Employee.Sex='M');

--2)	For each project, list the project name and the total hours per week
--(for all employees) spent on that project.
select * from dbo.Project
select * from dbo.Works_for
