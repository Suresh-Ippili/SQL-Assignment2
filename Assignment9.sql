create database PraciseDb
use PractiseDb

CREATE table Employee2
(id INT PRIMARY KEY,
name VARCHAR(20) NOT NULL,
exp INT CHECK(exp=2),
salary DECIMAL(10,2) CHECK(salary BETWEEN 12000 AND 30000),
department_name VARCHAR(25) CHECK (department_name IN('HR','Sales','Accts','IT')),
manager_name VARCHAR(20))

INSERT INTO Employee2 (id,name,exp,salary,department_name,manager_name)
VALUES
(1,'suresh',2,15000,'HR','sai'),
(2,'prasad',2,20000,'IT','dilli')

SELECT* FROM Employee2

--1. Dsiplay employee id , name , salary.
SELECT id,name,salary from Employee2

 --2.Display employee id , where Employee ID  , name where NAme of EMployee ,   salary Salary f EMployee shud be displayed
 SELECT id as Employee_ID,
 name as Name_of_Employee,
 salary as Salary_of_Employee
 from Employee2

 --3.Display  name  salary and also incremented salary for all the employees
 SELECT name,salary + 1000 as incremented_salary from Employee2

 --4. Display Total salary dispursed for all the departments
 SELECT SUM(salary) as Total_salary from Employee2 

 --5. Display total salary, maximum salary, Average salary given in all the deprtments
 SELECT SUM(salary) as total_salary,
 MAX(salary) as maximum_salary,
 AVG(salary) as average_salary
 from Employee2

 --6. Depending uopn salary, arrange the records
 SELECT * from Employee2
 ORDER BY salary asc

 --7. Give a unique sequence to all the employees
 SELECT * FRom Employee2
 ORDER BY id ASC,
  name ASC,
 exp ASC,
 salary ASC,
 department_name ASC,
 manager_name ASC 

 --8. Depending uopn salary, giv ranking tp all the employees
 SELECT 
    id,
    name,
    salary,
    RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM Employee2

-- Add one more column age in employees table
ALTER TABLE Employee2 ADD age INT

SELECT * FROM Employee2

-- Add one more column age in employees table
UPDATE Employee2 
SET age=26

ALTER TABLE Employee2
ADD  age INT DEFAULT 26 CHECK (age BETWEEN 26 AND 60)

DELETE FROM Employee2 where column=age

--12. how many departments are there in the department
select count(*) as department from Employee2

-- Display all the names of the employees in upper case
select upper(name) from Employee2

-- DIpslay only the first four alphbets from all the names
select substring(name,1,4) from Employee2

-- DIsplay the position of a in all the names
SELECT Name,
       CHARINDEX('a', Name) AS Position
FROM Employee2

--Display total number of employees working in every department
SELECT department_name,
       COUNT(id) AS TotalEmployees
FROM Employee2
GROUP BY department_name

--17.Display total number of employees working for every Manager
SELECT manager_name,
       COUNT(id) AS TotalEmployees
FROM Employee2
GROUP BY manager_name

-- DIsplay all the recirds where employee ID is 101, 102 or 110
select * from Employee2 where id in(101,102,110)

--Ive all records where empl id is in between 101 and 100
select * from Employee2 where id between 101 and 110

--20. Give all records where department is HR
select * from Employee2 where department_name='HR'

--21. Give all records where department is HR or Accts
select * from Employee2 where department_name in('HR','Accts')

--22. Give all records where name starts with A
select * from Employee2 where name like 'A%'

--3. GIve all records where name contains a
select * from Employee2 where name like 'a%'

--24. Give all records where average sales is less than 12000 department wise
SELECT *
FROM Employee2
WHERE  department_name IN (
    SELECT department_name
    FROM Employee2
    GROUP BY department_name
    HAVING AVG('Sales') < 12000
)


--25. Give records where department is not Accts and sales is not in between 10000 and 20000
SELECT *
FROM Employee2
WHERE department_name <> 'Accts'
  AND ('Sales' < 10000 OR 'Sales' > 20000)


