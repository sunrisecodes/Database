
SELECT Dnum, Dname, SSN, Fname 
FROM Departments JOIN Employee
ON MGRSSN = SSN

-----------------------
SELECT Dname, Pname 
FROM Departments D join Project P
on D.Dnum = P.Dnum

---------------------------------------
SELECT Pnumber, Pname, Plocation
FROM Project 
WHere City in ('Alex' , 'Cairo')

--------------------------------------
SELECT p.* 
from Project P 
where Pname like 'a%'

--------------------------------------
-- Begin and End Values are included in using Between --

SELECT Fname + ' ' + Lname As EmployeeFullName
from Employee
where Dno = 30
and Salary BETWEEN 1000 and 2000 

--------------------------------------
SELECT Fname +' '+ Lname as Employee_Name
from Employee E 
inner join Works_for WF
on E.SSN = WF.ESSn and Dno =10 and Hours >= 10 
inner join Project P
on WF.Pno = P.Pnumber and Pname ='Al Rabwah'

-------------------------------------------
SElECT x.Fname +''+x.Lname as [Employee Name], y.Fname +''+y.Lname as [Manager]
from Employee x,  Employee y 
 where y.SSN = x.Superssn
 And y.Fname ='Kamel' and y.Lname ='Mohamed'



SELECT E.Fname + ' ' + E.Lname AS [Employee Name]
FROM Employee E, Employee S
WHERE S.SSN = E.Superssn 
AND S.Fname + ' ' + S.Lname = 'Kamel Mohamed';

-----------------------------------------------
SELECT E.*, D.*
FROM Employee E
left outer join Dependent D
on E.SSN = D.ESSN
--9
SELECT E.Fname +' ' + E.Lname As [Employee Name], p.Pname
from Employee E join Works_for W
on E.SSN = W.ESSn
join Project P
on p.Pnumber = W.Pno
order By P.Pname

--10
SELECT P.Pnumber, D.Dname as [Controlling Department], E.Lname As [Manager LastName], E.Bdate, E.Address
FROM Project P
join Departments D
on p.Dnum = D.Dnum and p.City ='Cairo'
join Employee E
on D.MGRSSN = E.SSN

--11
SELECT E.Fname + ' ' + E.Lname As [Manager Name],
       E.Bdate , 
	   E.Address
FROM Employee E
join Departments D
on E.SSN = D.MGRSSN
 
 --11
 SELECT Distinict y.Fname + ' ' + y.Lname As [Manager Name],
        y.Bdate
 from Employee x 
 join Employee y
 on x.Superssn = y.SSN