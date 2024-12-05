---1
SELECT D.Dependent_name, D.Sex 
FROM Dependent D
JOIN Employee E
ON D.ESSN = E.SSN 
WHERE D.Sex = 'F' and E.Sex ='F'

UNION all

SELECT D.Dependent_name, D.Sex 
FROM Dependent D
JOIN Employee E
ON D.ESSN = E.SSN 
WHERE D.Sex = 'M' and E.Sex ='M'

---2
SELECT sum(WF.Hours) as [Total Hours], P.Pname
FROM Project P
JOIN Works_for WF
ON  P.Pnumber = WF.Pno
GROUP by P.Pname

----3
SELECT D.*
FROM Employee E
JOIN Departments D
on E.Dno = D.Dnum
where E.SSN = (SElECT Min(SSN) from Employee)


----4
--1)
SELECT D.Dname, AVG(E.Salary) As [Employee Average Salary] ,
MAX(E.Salary) As [Maximum Salary],
MIN(E.Salary) As [Minimum Salary]
FROM Departments D
JOIN Employee E
on E.Dno = D.Dnum
GROUP BY D.Dname

--2)
SELECT D.Dname , [Employee Average Salary], [Maximum Salary], [Minimum Salary]
FROM Departments D , 
(SELECT Dno,
        AVG(Salary) as [Employee Average Salary],
        MIN(Salary) as [Minimum Salary],
		MAX(Salary) as [Maximum Salary]
 from Employee 
 GROUP BY Dno) E
 where D.Dnum = E.Dno

 ----5
 SELECT x.Lname
 FROM Employee x
 JOIN Employee y
 ON x.SSN = y.Superssn
 where x.SSN NOT IN  (SELECT DISTINCT ESSN FROM Dependent)

----6
SELECT D.Dnum, D.Dname, COUNT(E.SSN) As [Employes]
From Departments D
Join Employee E
ON D.Dnum = E.Dno
GROUP BY D.Dnum , D.Dname
HAVING AVG(E.Salary) < (SELECT Avg(Salary) from Employee)

----7
SELECT E.Fname, E.Lname , P.Pname as [Project Name], E.Dno
FROM Employee E
JOIN Works_for WF
ON E.SSN = WF.ESSn
JOIN Project P
ON WF.Pno = P.Pnumber
ORDER BY E.Dno ,E.Fname, E.Lname

----8
SELECT DISTINCT E.Salary
FROM Employee E
where E.Salary in (SELECT TOP 2 E.Salary FROM Employee E GROUP BY E.Salary ORDER BY E.Salary DESC)
ORDER BY E.Salary DESC

----9
SELECT E.Fname + '' + E.Lname AS [Full Name]
FROM Employee E, Dependent D
WHERE  E.Fname + '' + E.Lname = D.Dependent_name

----10
UPDATE Departments 
SET MGRSSN = 968574
WHERE Dnum = 100

UPDATE Departments 
SET MGRSSN = 102672
WHERE Dnum = 20

UPDATE Employee
SET Superssn = 102672
WHERE SSN = 102660

----11
DELETE 
FROM Employee
WhERE SSN = 223344

UPDATE Works_for
SEt ESSn = 102672
WHERE ESSn = 223344

UPDATE Dependent
SEt ESSN = 102672
WHERE ESSn = 223344

UPDATE Departments
SEt MGRSSN = 102672
WHERE MGRSSN = 223344

UPDATE Employee
SEt Superssn = 102672
WHERE Superssn = 223344


----12
UPDATE Employee
SET salary = salary + (salary * 0.30)
from Employee E
JOIn Works_for WF
on E.SSN = WF.ESSn
JOIn Project p
ON WF.Pno = P.Pnumber AND P.Pname = 'Al Rabwah'
