----1)
create Proc GetStdsCount
as
select d.Dept_Name, COUNT(s.St_Id)  as 'Number of students'
   from Department d
join Student s
 on s.Dept_Id = d.Dept_Id
group by d.Dept_Name

----5)
Create procedure checkEmpCount
As

BEGIN
Declare @count int

Select @count = COUNT(wf.ESSn)
 FROM Works_for wf
 WHERE wf.Pno = 100

IF @count >= 3
   PRINT 'The number of employees in the project 100 is 3 or more'
ELSE
	BEGIN
		Select 'The following employees work for the project 100'
		select emp.Fname, emp.Lname
		from Employee emp
		join Works_for wf 
		on emp.SSN = wf.ESSn and wf.Pno = 100
	END

END;
----6)
Create procedure newEmployee 
                @oldEmp int,
				@newEmp int,
				@projectNo int
AS
BEGIN
 Update Works_for
 SET ESSn = @newEmp
 WHERE ESSn = @oldEmp and Pno = @projectNo
END;
