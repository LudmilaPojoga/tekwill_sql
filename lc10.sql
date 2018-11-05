-- MANAGING TABLES USING DML STATEMENTS
Create table employees_old as
Select *
From employees;

Create table jobs_old as
Select *
From jobs;

Create table departments_old as
Select *
From departments;

Create table job_history_old as
Select *
From job_history;

Create table countries_old as
Select *
From countries;

Create table locations_old as
Select *
From locations;

Create table job_grades_old as
Select *
From job_grades;

Create table regions_old as
Select *
From regions;

Insert Into departments(department_id, department_name, manager_id, location_id)
Values (280,'Public Relations',100,1700);

Insert Into departments(department_id, department_name)
Values (281,'Public Relations');

Insert Into departments(department_id, department_name, manager_id, location_id)
Values (282,'Public Relations',NULL,NULL);

Insert Into departments
Values (283,'Public Relations',100,1700);

Insert Into departments(department_id, department_name, manager_id, location_id)
Values ('Public Relations',NULL,NULL);

Select *
From departments;

Insert Into employees 
Values(207,'Ludmila','Pojoga','LPojoga','515.124.4567',SYSDATE,'AC_ACCOUNT',6900,NULL,205,110);

Insert Into employees
Values(208,'Ludmila','Pojoga','L.Pojoga','515.124.4567',to_date('20.10.05','DD.MM.YY'),'AC_ACCOUNT',7000,NULL,205,110);

SELECT *
From employees;

Insert Into departments (department_id, department_name, location_id)
Values (&department_id, '&department_name', &location_id);

Select *
From departments;

Create table sales_reps
(ID NUMBER(6) ,
NAME VARCHAR2(25),
SALARY NUMBER(8,2),
COMMISSION_PCT NUMBER(2,2));

Insert Into sales_reps
SELECT employee_id, last_name, salary, commission_pct
From employees;

Select *
From sales_reps;

Insert Into sales_reps
SELECT employee_id, last_name, salary, commission_pct
From employees;
--Where commission_pct>0; avem posibilitate sa punem conditie la copierea datelor din tabel in alt tabel

--UPDATE
Update employees
Set department_id=50
    ,first_name='Luisa'
Where employee_id=113;

Select *
From employees
Where employee_id=113;

Select job_id, salary
From employees
Where employee_id in (103, 205);

Update employees
SET (job_id,salary)=(Select job_id, salary
                    From employees
                    Where employee_id= 205)
Where employee_id=103;

Select *
From copy_emp;

INSERT INTO copy_emp
SELECT *
From employees;

Update copy_emp
SET department_id=(Select department_id
                   From employees
                   Where employee_id= 100)
Where job_id=(Select job_id
              From employees
              Where employee_id= 130);

--Delete
Select *
From copy_emp;

Select *
From employees;

Delete copy_emp
Where empno >206;

Delete From copy_emp
Where department_id IN (Select department_id
                      From departments
                      Where department_name LIKE '%Public%');
                      
--TRUNCATE (sterge toate datele din tabela)
Select *
From copy_emp
Where empno >206;

Truncate table copy_emp;

--orice Tranzactie incepe cu Start si se termina cu END
INSERT INTO copy_emp
SELECT *
From employees;
Commit; -- salveaza ultima modificare

Delete copy_emp
Where empno >206;

rollback; --returneaza operatiunea pina la commit

Select *
From copy_emp
Where empno >206;
commit;

Insert into copy_emp (empno, first_name)
values (202, 'Pat');

Roll Back;

Select *
From copy_emp;

Delete copy_emp
Where empno =202
And email is NULL;
Commit;
Savepoint first_savepoint;
Rollback to first_savepoint;

--Tema pt acasa
--1
CREATE TABLE my_employee
  (ID number(4) not null,
   last_name VARCHAR2(25),
   first_name VARCHAR2(25),
   userid VARCHAR2(8),
   salary NUMBER(9,2));
   
--2
DESC my_employee;
--3
INSERT INTO my_employee
VALUES (1, 'Patel', 'Ralph', 'rpatel', 895);

--4
INSERT INTO my_employee(ID, last_name, first_name, userid, salary)
VALUES (2, 'Dancs', 'Betty', 'bdancs', 860);
--5
Select *
From my_employee;
--6
INSERT INTO my_employee
VALUES (&ID, '&last', '&first', '&mail', &salary);
--7--9
COMMIT;
--10
UPDATE my_employee
SET last_name='Drexler'
Where ID=3;
--11
UPDATE my_employee
SET salary=1000
Where salary<900;
--12
Select *
From my_employee;
--13
Delete from  my_employee
Where first_name='Betty';
--14--15--16--17
commit;
--18
Savepoint first_savepoint;
--19
Delete from  my_employee;
--20
Select *
From my_employee;
--21--22
Rollback to first_savepoint;
--23
commit;
--24
UPDATE my_employee
SET userid=lower(SUBSTR(first_name,1,1))||lower(SUBSTR(last_name,1,7));
--25
INSERT INTO my_employee
VALUES (6, 'Anthony', 'Mark', 'manthony', 1230);





