--teme pt acasa
--ex4
SELECT MAX(salary) Maximum,
       MIN(salary) Minimum,
       SUM(salary) SUMM,
       ROUND(AVG(salary)) Average
FROM employees;

--ex5
SELECT job_id,
       MAX(salary) Maximum,
       MIN(salary) Minimum,
       SUM(salary) SUMM,
       ROUND(AVG(salary)) Average
FROM employees
Group By job_id;

SELECT *
FROM employees;

--ex6
SELECT job_id,
       COUNT(job_id)
FROM employees
GROUP BY job_id;

SELECT job_id,
       COUNT(*)
FROM employees
WHERE job_id='&job'
GROUP BY job_id;

--ex7
SELECT COUNT(manager_id) as "Number of Managers"
From employees;

--ex8
Select Max(salary)-Min(salary) as Difference
From employees;

--ex9
SELECT NVL(manager_id,0),
       MIN(salary)
From employees
Group By manager_id
Having (NVL(manager_id,0)>0) and Min(salary)>6000
Order By 2 desc;

--ex10
SELECT COUNT (*) as Total,
       sum(DECODE(to_char(hire_date, 'YYYY'),2011,1,0)) as "2011",
       sum(case WHEN to_char(hire_date,'YYYY')=2012 then 1 else 0 END) as "2012",
       sum(case WHEN to_char(hire_date,'YYYY')=2013 then 1 else 0 END) as "2013",
       sum(case WHEN to_char(hire_date,'YYYY')='2014' then 1 else 0 END) as "2014"
From employees;

--ex11
SELECT job_id,
       sum(DECODE(department_id,20,salary)) as "dept 20",
       sum(DECODE(department_id,50,salary)) as "dept 50",
       sum(DECODE(department_id,80,salary)) as "dept 80",
       sum(DECODE(department_id,90,salary)) as "dept 90",
       sum(salary) as Total
From employees
Group By job_id;

--NATURAL JOIN
Select *
From employees
Natural join jobs;

Select employees.first_name,
       employees.last_name,
       jobs.job_title
From employees
Natural join jobs;

Select first_name,
       last_name,
       job_title,
       job_id
From employees
Natural join jobs;

Select *
From employees
natural join jobs
natural join departments
Where employee_id=102;

-- JOIN USING COLUMN
Select *
From employees
join jobs using (job_id)
join departments using(department_id)
Where employee_id=100;

Select *
From employees
join jobs using (job_id)
join departments using(manager_id);

-- JOIN ON (inner join)
Select *
From employees T1
join jobs T2 
ON T1.job_id=T2.job_id;

Select T1.*,
       T2.job_title,
       T2.min_salary
From employees T1
join jobs T2 --se poate de scris si inner join (este acelasi lucru)
ON T1.job_id=T2.job_id;

Select T1.*,
       T2.job_title,
       T2.min_salary,
       t3.*
From employees T1
join jobs T2 
ON T1.job_id=T2.job_id
join departments t3
ON T1.department_id=t3.department_id
WHERE T1.employee_id=102;

Select t1.last_name||' '||first_name nume,
       t2.job_title,
       t2.min_salary,
       t3.*
From employees t1
join jobs t2 
ON t1.job_id=t2.job_id
join departments t3
ON t1.department_id=t3.department_id
WHERE t3.department_id=90; --in loc de where se poate de folosit si AND

Select t1.employee_id,
       t1.last_name||' '||t1.first_name nume_angajat,
       t1.manager_id,
       t2.employee_id,
       t2.last_name||' '||t2.first_name nume_manager
FROM employees t1
JOIN employees t2
ON t1.manager_id=t2.employee_id; --(ne arata fiecare angajat ce manager are)

Select t1.employee_id,
       t1.last_name||' '||t1.first_name nume_manager,
       t1.manager_id,
       t2.employee_id,
       t2.last_name||' '||t2.first_name nume_angajat
FROM employees t1
JOIN employees t2
ON t2.manager_id=t1.employee_id
ORDER BY 1; --(ne arata fiecare manager ce angajati are)

SELECT a.*,
       b.job_title
FROM employees a
Join jobs b
ON a.salary between b.MIN_SALARY and MAX_SALARY; --aici folosim Between ca sa putem face Join cu coloane care au denumiri diferite

SELECT a.employee_id,
       COUNT(a.employee_id),
       b.job_title
FROM employees a
JOIN jobs b
ON a.salary between b.MIN_SALARY and MAX_SALARY
GROUP BY a.employee_id, b.job_title
HAVING COUNT (a.employee_id)>1; --(asa exemplu se foloseste atunci cind vrem sa gasim ce id se repeta)

Select t1.employee_id,
       t1.last_name||' '||t1.first_name nume_ang,
       t1.manager_id,
       t2.employee_id,
       t2.last_name||' '||t2.first_name nume_man
FROM employees t1
Left JOIN employees t2 --(OUTER JOIN)
ON t1.manager_id=t2.employee_id
ORDER BY 1;       

SELECT *
FROM employees a
JOIN departments b;

Select t1.employee_id,
       t1.last_name||' '||t1.first_name nume_ang,
       t2.employee_id,
       t2.last_name||' '||t2.first_name nume_man
FROM employees t1
RIGHT JOIN employees t2 --(OUTER JOIN)
ON t1.manager_id=t2.employee_id
WHERE t1.employee_id IS NULL
ORDER BY 3;--(arata managerii care nu au subalterni)

--Tema pt acasa
--ex 1
SELECT location_id,
       street_address,
       city,
       state_province,
       country_name
FROM locations
Natural join countries;

--ex2
Select last_name,
       department_id,
       department_name
From employees
Natural join departments;

--ex3
Select a.last_name,
       a.job_id,
       a.department_id,
       b.department_name
From employees a
Join departments b
ON a.department_id=b.department_id
Join locations c
Using (location_id)
Where c.city='Toronto';

--ex4
Select t1.last_name as Employee,
       t1.employee_id as Emp#,
       t2.last_name as Manager,
       t2.employee_id as Man#
FROM employees t1
JOIN employees t2
ON t1.manager_id=t2.employee_id;

--ex5
Select t1.last_name as Employee,
       t1.employee_id as Emp#,
       t2.last_name as Manager,
       t2.employee_id as Man#
FROM employees t1
Left JOIN employees t2
ON t1.manager_id=t2.employee_id
Order By 2;

--ex6
Select a.department_id Department,
       a.last_name employee,
       b.last_name colleague
From employees a
Join employees b
ON a.department_id=b.department_id
WHERE a.employee_id<>b.employee_id;

--ex7
Select a.last_name,
       a.job_id,
       b.department_name,
       a.salary,
       c.grade_level
From employees a
Join departments b
On a.department_id=b.department_id
Join job_grades c
ON a.salary Between (lowest_sal) and (highest_sal);

--ex8
Select t1.last_name as Employee,
       t1.hire_date as Emp     
FROM employees t1
JOIN employees t2
on t2.last_name='Davies'
Where t1.hire_date>t2.hire_date;

--ex9
Select t1.last_name as Employee,
       t1.hire_date as Emp#,
       t2.last_name as Manager,
       t2.hire_date as Man#
FROM employees t1
Join employees t2
ON t2.employee_id=t1.manager_id
AND t2.hire_date>t1.hire_date
Order By 1;

--Tema in clasa --1
SELECT a.last_name||' '||a.first_name as Full_name,
       a.department_id,
       b.department_name
From employees a
Left Join departments b
ON a.department_id=b.department_id;

--1b
SELECT department_name,
       count(employee_id)
From employees a
Right Join departments b
ON a.department_id=b.department_id
Group By department_name
Order By 2 desc;

--2
SELECT last_name,
       department_name,
       street_address,
       city,
       state_province,
       country_name,
       region_name
FROM departments a
left join locations b
On a.location_id=b.location_id
Right join employees c
ON c.department_id=a.department_id
left join countries d
on b.country_id=d.country_id
left join regions e
on d.region_id=e.region_id;

--3
SELECT a.first_name,
       a.last_name,
       a.salary
FROM employees a
Join employees b
On b.employee_id=182
Where a.salary<b.salary;

--4
Select t1.last_name||' '||t1.first_name as Employee,
       t1.salary as Emp_sal,
       t2.last_name||' '||t2.first_name as Manager,
       t2.salary as Mng_sal,
       t2.salary-t1.salary as diferenta
FROM employees t1
Left Join employees t2
ON t2.employee_id=t1.manager_id;

--5
Select t1.last_name as Employee,
       t3.department_name as Departament   
FROM employees t1
JOIN employees t2
ON t1.department_id=t2.department_id
AND t2.last_name='Taylor'
Join departments t3
ON t1.department_id=t3.department_id;

--6
Select last_name||' '||first_name as Employee,
       salary,
       highest_sal,
       highest_sal-salary as Dif
From employees
Join job_grades
ON salary between lowest_sal and highest_sal;

Select last_name||' '||first_name as Employee,
       salary,
       max_salary,
       max_salary-salary as Dif
From employees
Natural Join jobs;

--7
Select last_name||' '||first_name as Employee,
       job_title,
       department_name,
       start_date
From employees
Join jobs
Using (job_id)
Join departments
Using (department_id)
Join job_history
Using (job_id)
WHERE start_date between '01-JAN-93' and '31-AUG-97';

--8
Select department_name,
       ROUND(AVG(salary),1),
       Count(employee_id)
From employees a
Join departments b
On  a.department_id=b.department_id
Where a.commission_pct>0
Group By b.department_name;
    
Create table job_grades
As(
Select 'A' grade_level,1000 lowest_sal,2999 highest_sal From dual
Union
Select 'B',3000,5999 From dual
Union
Select 'C',6000,9999 From dual
Union
Select 'D',10000,14999 From dual
Union
Select 'E',15000,24999 From dual
Union
Select 'F',25000,40000 From dual);
--24.10.18
--ex9
Select last_name||' '||first_name as Employee,
       job_title,
       department_id
From employees
Natural Join jobs
Where department_id=80;

Select last_name||' '||first_name as Employee,
       job_title,
       department_id
From employees
Join jobs Using (job_id)
Where department_id=80;

Select last_name||' '||first_name as Employee,
       job_title,
       department_id
From employees a
Join jobs b On a.job_id=b.job_id
Where department_id=80;

--10
Select street_address,
       city,
       country_name,
       department_name
From locations a
Join countries b 
On a.country_id=b.country_id
Join departments c
On a.location_id=c.location_id;

--11
Select department_name,
       last_name||' '||first_name as manager
From departments a
Left Join employees b
On a.manager_id=b.employee_id;

Select *
From employees; 

--12
SELECT job_title,
       avg(salary)
From jobs a
Join employees b
On a.job_id=b.job_id
Group By job_title;

--13
SELECT last_name||' '||first_name employee, 
       job_title,
       salary
From jobs a
Join employees b
On a.job_id=b.job_id
Join job_history c
On a.job_id=c.job_id
Where salary>12000;

--14
Select department_name,
       last_name||' '||first_name as manager,
       city
From departments a
Join employees b
On a.manager_id=b.employee_id
Join locations c
ON c.location_id=a.location_id;

Select *
From departments;

--15
SELECT last_name||' '||first_name employee, 
       job_title,
       Round(sysdate-hire_date)
From jobs a
Join employees b
On a.job_id=b.job_id
Where department_id=80;

--16
Select department_name,
       last_name||' '||first_name as employee,
       city,
       salary
From departments a
Join employees b
On a.department_id=b.department_id
Join locations c
ON c.location_id=a.location_id
Where c.city IN 'London';

Select *
From departments
Natural join locations;

--17
Select department_name,
       count(employee_id)
From departments a
Join employees b
On a.department_id=b.department_id
Group By department_name;

--USING INNER joins = JOIN WHERE
Select b.*
From employees a
JOIN employees b
ON a.manager_id=b.employee_id;

SELECT b.*
FROM employees a, employees b
Where a.manager_id=b.employee_id; --aceeasi forma de inner join

Select b.*
From employees a
LEFT JOIN employees b
ON a.manager_id=b.employee_id;

SELECT b.*
FROM employees a, employees b
Where a.manager_id=b.employee_id(+);--aceeasi forma de left join, in loc de care se scrie (+) in partea dreapta

Select b.*
From employees a
RIGHT JOIN employees b
ON a.manager_id=b.employee_id;

SELECT b.*
FROM employees a, employees b
Where a.manager_id(+)=b.employee_id; --aceeasi forma de right join, (+) se pune in stinga
      

