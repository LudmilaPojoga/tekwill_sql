--USING SET OPERATORS
Select*
From employees;

Select *
From retired_emps;

--UNION uneste 2 tabele si exclude dublicatele
Select distinct b.*,
       'Employees_manager' as emp_type
From employees a
Join employees b
on a.manager_id=b.employee_id
Union
SELECT a.*,  'Department_mananager' as emp_type
From employees a
Join departments b
on a.employee_id=b.manager_id;

--UNION ALL uneste 2 tabele indiferent de dublicate (coloanele si tipul lor trebu sa coincida)
Select distinct b.*     
From employees a
Join employees b
on a.manager_id=b.employee_id
Union all
SELECT a.*
From employees a
Join departments b
on a.employee_id=b.manager_id;

Select t1.job_title,
       t2.*
FROM(    Select distinct b.*     
           From employees a
           Join employees b
           on a.manager_id=b.employee_id
           Union all
           SELECT a.*
           From employees a
           Join departments b
          on a.employee_id=b.manager_id) t2
Left Join jobs t1
ON t2.job_id=t1.job_id; --tabela obtinuta prin union poate fi folosita ca subquery, sau join pt alte tabele
      
Select *
From (Select distinct b.*     
      From employees a
      Join employees b
      on a.manager_id=b.employee_id
      Union all
      SELECT a.*
      From employees a
      Join departments b
      on a.employee_id=b.manager_id);  --asa am obtinut toti managerii si de departamente si de angajati
      
Select *
From (Select distinct b.*     
      From employees a
      Join employees b
      on a.manager_id=b.employee_id) t1
Full JOIN
      (SELECT a.*
      From employees a
      Join departments b
      on a.employee_id=b.manager_id) t2
ON t1.employee_id=t2.employee_id;  --asa am obtinut toti managerii si de departamente si de angajati insa coincidentele au fost scoase

Insert Into retired_emps
Select 209,'Nanc Gren'  ,'FI_MGR'  ,100,'17-AUG-10','17-AUG-15',12008,null,80 From dual
Union ALL
Select 210,'Danel Faet' ,'ST_CLERK',123,'16-AUG-10','10-JUL-12',9000,0.35,90 From dual    
Union All
Select 211,'Jon Chn'     ,'PU_MAN'  ,131,'28-SEP-13','05-DEC-14',8200,1.15,80 From dual
Union All
Select 212,'Doug Gree'  ,'SH_CLERK',147,'13-JAN-16','13-MAY-18',2600,null,50 from dual
Union all
Select 213,'Jenn Whal'  ,'AD_ASST' ,108,'17-SEP-11','17-OCT-15',4400,0.25,10 from dual
Union all
Select 214,'Mich Hart'    ,'MK_MAN'  ,149,'17-FEB-12','20-FEB-13',13000,0.2,20 from dual
Union all
Select 215,'Pa Fy'      ,'MK_REP'  ,205,'17-AUG-13','17-NOV-14',6000,null,20 from dual;

Select *
From retired_emps;

Select last_name||' '||first_name as Name,
       job_id,
       hire_date,
       salary
From employees
Union 
Select ename,
       job,
       hiredate,
       sal
From retired_emps;

-- Intersect
Select last_name||' '||first_name as Name,
       job_id,
       hire_date,
       salary
From employees
Intersect
Select ename,
       job,
       hiredate,
       sal
From retired_emps;

Insert Into retired_emps
Select 2015,'Olson TJ'  ,'ST_CLERK'  ,100,'10-APR-15','17-AUG-15',2100,null,80 From dual;

-- Minus
Select last_name||' '||first_name as Name,
       job_id,
       hire_date,
       salary
From employees
Minus
Select ename,
       job,
       hiredate,
       sal
From retired_emps
Order By 1; -- se foloseste doar o data la sfirsit pt toate selecturile !

--Tema pt acasa
--ex1
Select department_id
From departments
MINUS
Select department_id
From departments
Where job_id='ST_CLERK';

--ex2 nu e corect
Select country_id, country_name
From countries
MINUS
(Select a.country_id, a.country_name
From countries a
Join locations b 
on a.country_id=b.country_id
Join departments c 
on b.location_id=c.location_id
Where department_id is NULL);

--ex3
Select employee_id, job_id, department_id
From employees
Where department_id=50
UNION 
Select employee_id, job_id, department_id
From employees
Where department_id=80;

--ex4
Select employee_id
From employees
Where job_id='SA_REP'
INTERSECT
Select employee_id
From employees
Where department_id=80;

--ex5  ?
Select last_name, department_id, 'Null'
From employees
UNION ALL
Select 'NULL', department_id, department_name
From departments;








      