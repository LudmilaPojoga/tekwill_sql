SELECT student_id, first_name, student_reg_year AS Admission
FROM ad_student_details;

SELECT *
FROM ad_course_details;

SELECT student_id,
       first_name,
       STUDENT_REG_YEAR,
       STUDENT_REG_YEAR+2 AS "COURSE EXPIRE"
FROM ad_student_details;

DESC AD_COURSE_DETAILS;

SELECT course_id, 
course_name,
session_id,
department_id
FROM ad_course_details;

DESC ad_student_details;

SELECT student_id,
       first_name,
       parent_id,
       student_reg_year AS registration
FROM ad_student_details;

SELECT DISTINCT name
FROM ad_exam_details;

SELECT student_id AS "Student #",
       first_name AS Student,
       parent_id AS "Parent information",
       student_reg_year AS "Registered On"
FROM ad_student_details;

SELECT first_name||' '||last_name AS "Nume Prenume",
     hire_date,
       salary
FROM employees; 

SELECT Employee_id,
       First_name,
       last_name
       , salary*12
FROM employees;

SELECT first_name||q'{'s last name is: }'||last_name AS nume
FROM employees;
SELECT first_name||q'['s last name is: ]'||last_name
FROM employees;

SELECT DISTINCT  name                
FROM ad_exam_details;
                
SELECT employee_Id, 
       last_name,
       job_id,
       department_id
FROM  employees
WHERE department_id=90;

SELECT *
FROM employees
WHERE last_name='King';

SELECT *
FROM employees
WHERE hire_date='09-JUL-14';

SELECT  *
FROM employees
WHERE salary <=3000;

SELECT  *
FROM employees
WHERE salary >=3000;

SELECT  *
FROM employees
WHERE salary <>9000;

SELECT  *
FROM employees
WHERE salary !=9000;

SELECT  *
FROM employees
WHERE salary BETWEEN 2500 AND 3500;

SELECT  *
FROM employees
WHERE hire_date BETWEEN '17-OCT-11' and '09-JUL-14';

SELECT  *
FROM employees
WHERE manager_id IN(124, 149);

SELECT  *
FROM employees
WHERE last_name IN('Rajs', 'Vargas');

SELECT  *
FROM employees
WHERE hire_date IN('09-JUL-14', '03-JAN-14');

SELECT  *
FROM employees
WHERE first_name LIKE'A%';

SELECT  *
FROM employees
WHERE first_name LIKE'E%';

SELECT  *
FROM employees
WHERE first_name LIKE'%e';

SELECT  *
FROM employees
WHERE first_name LIKE'__e%';

SELECT  *
FROM employees
WHERE last_name LIKE'%s';

SELECT  *
FROM employees
WHERE job_id LIKE'%CLERK%';

SELECT  *
FROM employees
WHERE job_id LIKE'ST%';

SELECT  *
FROM employees
WHERE job_id LIKE'___%';

SELECT  *
FROM employees
WHERE commission_pct IS NOT NULL; 

SELECT  *
FROM employees
WHERE commission_pct IS NULL;

SELECT  *
FROM employees
WHERE salary>=10000
AND job_id LIKE '%MAN%'
AND commission_pct IS NOT NULL;

SELECT  *
FROM employees
WHERE salary>=6000
AND job_id LIKE '%MAN%'
OR job_id LIKE '%REP%'
AND commission_pct IS NOT NULL;

SELECT *
FROM departments;

SELECT *
FROM locations;

SELECT  first_name, last_name, department_id, phone_number, job_id, salary 
FROM employees
WHERE department_id=50
AND job_id ='ST_CLERK'
AND phone_number like '%4';

SELECT  *
FROM employees
WHERE job_id LIKE 'IT%'
AND salary BETWEEN 4000 AND 10000;

SELECT  *
FROM employees
WHERE department_id=60
OR department_id=80
AND salary >10000;

SELECT  *
FROM employees
WHERE (department_id=60
OR department_id=80)
AND salary >10000;

SELECT  *
FROM employees
WHERE (job_id IN 'SA_REP'
OR job_id IN 'SA_MAN')
AND phone_number LIKE '0%';

SELECT  *
FROM employees
WHERE (job_id IN 'SA_REP'
OR job_id IN 'SA_MAN')
AND phone_number LIKE '0%'
ORDER BY salary ASC;

SELECT  *
FROM employees
WHERE (job_id IN 'SA_REP'
OR job_id IN 'SA_MAN')
AND phone_number LIKE '0%'
ORDER BY salary DESC;

SELECT  last_name || first_name AS fullname
FROM employees
Order By fullname DESC;

SELECT  last_name || first_name AS fullname,
        salary as salariu
FROM employees
Order By salariu, fullname ASC;

SELECT  last_name || first_name AS fullname,
        salary as salariu
FROM employees
Order By 1 asc, 2 desc;

SELECT *
FROM employees
Order By employee_id
FETCH FIRST 10 ROWS ONLY;

SELECT *
FROM employees
Order By employee_id
OFFSET 2 rows FETCH FIRST 8 rows only;

SELECT *
FROM employees
Order By salary
OFFSET 1 row FETCH FIRST 17 rows with ties;

SELECT *
FROM employees
WHERE employee_id = &employee_num;

-- 1) lista studentilor care au mai mult de 15 absente
SELECT student_id,
       no_of_days_off
FROM ad_student_attendance
WHERE NO_OF_DAYS_OFF >15;

-- 2) aratati numele cursului si department id pentu curs id=199
SELECT course_name,
       department_id
FROM ad_course_details
WHERE course_id=199;

-- 3) aratati studentii care au note mai joase de 65 si mai inalte de 90
SELECT student_id,
       marks
FROM ad_exam_results
WHERE marks NOT BETWEEN 65 AND 90;

-- 4) aratati studentii cu numele Nina si Robert
SELECT student_id,
       first_name,
       student_reg_year
FROM ad_student_details
WHERE first_name IN ('NINA', 'ROBERT')
ORDER BY student_reg_year ASC;

-- 5) numele cursului si depart_id pt departament 20 sau 40
SELECT course_name,
       department_id
FROM ad_course_details
WHERE department_id IN (20 , 40)
ORDER BY course_name ASC;

-- 6)aratati studentii care au note intre 65 si 90
SELECT student_id AS student#,
       marks AS "Semester Marks"      
FROM ad_exam_results
WHERE marks BETWEEN 65 AND 90
AND course_id IN (199,189);

-- 7) toti studentii inregistrati in 2014
SELECT student_id,
       first_name,
       student_reg_year
FROM ad_student_details
--WHERE student_reg_year LIKE '%14';
WHERE student_reg_year BETWEEN '01-JAN-14' AND '31-DEC-14';

-- 8) studentii care nu au email
SELECT  first_name,
        parent_id
FROM ad_student_details
WHERE email_addr is null;

-- 9)studentii care au email
SELECT first_name,
       student_reg_year,
       email_addr
FROM ad_student_details
WHERE email_addr is not null
ORDER BY student_reg_year DESC,
        email_addr DESC;

-- 10) studentii care au note mai mari de cit cea ceruta in prompt
SELECT student_id,
       marks
FROM ad_exam_results
WHERE marks > &marks_prompt;

-- 11) se cere cursul pt un departament anumit in prompt
SELECT course_id,
       course_name,
       session_id
FROM ad_course_details
WHERE department_id = &department_id
ORDER BY &order_col ASC;

--12) 
SELECT first_name
FROM ad_student_details
WHERE first_name LIKE '_O%';

--13)
SELECT first_name
FROM ad_student_details
WHERE first_name LIKE '%A%'
AND first_name LIKE '%N%';

--14)
SELECT course_id,
       course_name
FROM ad_course_details
WHERE department_id IN (10, 40)
AND session_id NOT IN (200, 300);


--15)
SELECT student_id AS student#,
       exam_id AS "exam code",
       course_id AS "course code",
       marks AS Score
FROM ad_exam_results
WHERE marks =70
ORDER BY student#;

SELECT *
FROM employees
WHERE employee_id=&employee_num;

SELECT *
FROM employees
WHERE first_name='&nume';

SELECT *
FROM employees
WHERE hire_date='&date';

SELECT first_name,
       last_name,
       &hide_column
FROM employees
WHERE hire_date='&date'
ORDER BY &hide_order_column;

SELECT first_name,
       last_name,
       &hide_column
FROM employees;

SELECT employee_id,
       last_name,
       first_name,
       salary,
       &&hide_column
FROM employees
ORDER BY &hide_column DESC; 

SELECT employee_id,
       last_name,
       first_name,
       salary,
       &&hide_column,
       &&department_column
FROM employees
ORDER BY &hide_column desc, &department_column asc;

undefine hide_column;
undefine department_column;

Define hide_column=salary; 

SELECT employee_id,
       last_name,
       first_name,
       &hide_column
FROM employees
ORDER BY &hide_column desc;

set verify on
SELECT employee_id,
       last_name,
       first_name,
       &&hide_column,
       &&department_column
FROM employees
ORDER BY &hide_column desc, &department_column asc;

SELECT  last_name,
       first_name,
       LOWER (first_name),
       UPPER (last_name),
       INITCAP (last_name)
FROM employees;

SELECT  last_name,
       first_name,
       LOWER (first_name),
       UPPER (last_name),
       INITCAP (last_name)
FROM employees
WHERE LOWER (first_name) like '%a%';

SELECT  last_name,
       first_name,
       CONCAT(first_name ,last_name) as full_name
FROM employees;

SELECT  last_name,
       first_name,
       SUBSTR(first_name,1,4) as prescurtat,
       SUBSTR(first_name,-4,4) as ultimlele4,
       Length(first_name),
       instr(first_name,'e',1,1)
FROM employees;

SELECT INSTR('MD_2002, or.Chisinau, str.M.Eminescu, ap2',',',1,1)
FROM dual;

SELECT Substr ('MD_2002, or.Chisinau, str.M.Eminescu, ap2',1,INSTR('MD_2002, or.Chisinau, str.M.Eminescu, ap2',',',1,1))
FROM dual;

define test= 'MD_2002, or.Chisinau, str.M.Eminescu, ap2'
SELECT Substr ( '&test',1, INSTR ('&test',',',1,1))
FROM dual;

--ex2 tema 7
SELECT student_id,
       course_id,
       marks,
       marks*1.15 AS "New Score"
FROM ad_exam_results;

--ex5
SELECT INITCAP(first_name) as Name,
       Length (first_name) AS length
FROM ad_student_details
WHERE first_name LIKE 'J%'
OR first_name LIKE 'R%'
OR first_name LIKE 'M%'
ORDER BY Name;

SELECT INITCAP(first_name) as Name,
       Length (first_name) AS length
FROM ad_student_details
WHERE first_name = like '&nume%'
ORDER BY Name;

use ora 02
SELECT *
from String_Addreses;

Create table String_Addreses as
Select 'MD-2002,or.Chisinau, str. Mihai Eminescu 12, ap.28' as address from dual
Union
Select '2010,or.Chisinau, str. Grigore Vieru 50, ap.3' as address from dual
Union
Select 'MD2015,or.Chisinau, str. Ion Creanga 4, ap.17'  as address from dual
Union
Select 'md-2030,Chisinau, st. Muncesti 8, ap.54'  as address from dual
Union
Select 'MD-2004,Chisineov, str-da. Bucuriei 2, ap.23'  as address from dual
Union
Select 'Md-2045,or Chisin., s. Ion Inculet 8, ap.50'  as address from dual
Union
Select 'Md2013,chisinau, str. Vasile Lupu 40, ap.20'  as address from dual
Union
Select 'MD2031,or.CHISINAU,'  as address from dual
Union
Select 'md2017,or.CH, str. , ap.28'  as address from dual;

SELECT *
FROM String_Addreses;

SELECT ADDRESS,
       SUBSTR(ADDRESS,1, INSTR (ADDRESS,',',1,1)) AS col,
       SUBSTR(SUBSTR(ADDRESS,1, INSTR (ADDRESS,',',1,1)),-5,4) as adr,
       CONCAT ('MD_',SUBSTR(SUBSTR(ADDRESS,1, INSTR (ADDRESS,',',1,1)),-5,4)) as adresa
FROM String_Addreses;

SELECT salary,
       lpad(salary,6,'$'),
       rpad(salary,6,'$')
FROM employees;

SELECT salary,
       concat(concat(concat(first_name, concat(' ',last_name)),' '),salary) as full_name,
       lower ( concat(concat(concat(first_name, concat(' ',last_name)),' '),salary)) as name_mic,
       upper ( concat(concat(concat(first_name, concat(' ',last_name)),' '),salary)) as nume_mare
FROM employees;

SELECT --ROUND (100.455321, 2), rotungeste zecimalele
       ROUND (100.455321, 2),
       ROUND (100.455321),
       -- ROUND (100.455321, -1), rotungeste unitatile
       -- ROUND (150.455321, -2), rotungeste zecile
        TRUNC (100.455321,2), --taie zecimalele
        ceil (100.455321), --rotungeste in sus
        floor(100.455321) --rotungeste in jos
FROM dual;


SELECT mod (10,5),
       mod (10,3) -- arata cit rest ramine de la impartire
FROM dual;

--tema pe acasa Activity L3
--1)Lucratorii cu salariu mai mare de 12000
SELECT last_name,
       salary
FROM employees
WHERE salary >12000;

--2)angajatul cu nr 176
SELECT last_name,
       department_id
FROM employees
WHERE employee_id =176;

--3)salariatii cu cele mai mici si cele mai mari salarii
SELECT last_name,
       salary
FROM employees
WHERE salary NOT BETWEEN 5000 AND 12000;

--4)
SELECT last_name,
       job_id,
       hire_date             
FROM employees
WHERE last_name IN ('Matos', 'Taylor')
ORDER BY hire_date ASC;

--5)
SELECT last_name,
       department_id
FROM employees
WHERE department_id=20
OR department_id=50
ORDER BY last_name ASC;

--6)
SELECT last_name as Employee,
       salary as "Monthly Salary"
FROM employees
WHERE salary BETWEEN 5000 AND 12000
AND (department_id=20
OR department_id=50);

--7)
SELECT last_name,
       hire_date             
FROM employees
WHERE hire_date LIKE '%6';

--8)
SELECT last_name,
       job_id             
FROM employees
WHERE manager_id IS NULL;

--9)
SELECT last_name,
       salary,
       commission_pct
FROM employees
WHERE commission_pct IS NOT NULL
ORDER BY 2 DESC, 3 DESC;

--10)
SELECT last_name,
       salary       
FROM employees
WHERE salary > &salariu;

--11)
SELECT employee_id,
       last_name,
       salary,
       department_id
FROM employees
WHERE manager_id = &manager_num
ORDER BY &numar_coloana;

--12)
SELECT employee_id,
       last_name
FROM employees
WHERE last_name LIKE '__a%';

--13)
SELECT employee_id,
       last_name
FROM employees
WHERE last_name LIKE '%a%'
AND last_name LIKE '%e%';

--14)
SELECT last_name,
       job_id,
       salary
FROM employees
WHERE job_id IN ('SA_REP', 'ST_CLERK')
AND salary NOT IN (2500, 3500, 7000);

--15)
SELECT last_name as Employee,
       salary as "Monthly Salary",
       commission_pct
FROM employees
WHERE salary BETWEEN 5000 AND 12000
AND commission_pct =0.20;

SELECT SYSDATE,
       current_date,
       sessiontimezone,
       current_timestamp
FROM dual;

SELECT last_name,
       sysdate,
       hire_date,
       ROUND((sysdate-hire_date)/7,2) as Weeks
FROM employees;

SELECT round((sysdate-start_date)) days,
       round((sysdate-start_date)/7) weeks
FROM ad_exam_details
WHERE exam_id=550;

SELECT first_name ||' '|| last_name,
       sysdate,
       hire_date,
       ROUND((sysdate-hire_date)/365) as how_old_was_hired
FROM employees
WHERE  ROUND((sysdate-hire_date)/365)>5;

-- DATE manipulation function : 
SELECT first_name ||' '|| last_name,
       sysdate,
       hire_date,
       ROUND((sysdate-hire_date)/365.25*12) as month_was_hired,
       round(MONTHS_BETWEEN(sysdate,hire_date)) nr_of_month, -- arata cite luni sunt intre 2 date
       add_months(sysdate,2)as ADD_M,      -- ne aduna un nr anumit de luni la o data oarecare
       NEXT_DAY(sysdate,'THU')as joi, -- ne arata pe ce data va fi urmatoarea de ex joi de la data scrisa
       NEXT_DAY(sysdate,4)as "a 4 zi", -- ne arata pe ce data va fi urmatoarea de ex a 4 zi din saptamina de la data scrisa
       LAST_DAY(sysdate) as ultima_zi -- ne arata ultima zi din luna respectiva
       ,ROUND(hire_date,'month') as luna  -- rotungeste luna, data pina la 15 o rotungeste la 1, mai sus de 15 rotungeste la urm luna
       ,ROUND(hire_date,'year') as anul  -- daca data curenta este in prima jumate de an el rotungeste spre 1 ianuarie anul curent,
                               -- daca data este in a 2 jumate de an, el rotungeste spre 1 ianuarie urmatorul an
       ,TRUNC(hire_date,'month')as prima_zi -- ne intoarce laprimazi a lunii
       ,TRUNC(hire_date,'year')as an -- ne intoarce la prima luna din anul dat
FROM employees;

--tema pe acasa L4
--ex 1
SELECT sysdate
FROM dual;

--ex2
SELECT employee_id,
       last_name,
       salary,
       ROUND(salary*1.155) AS "New Salary"
FROM employees;

--ex4
SELECT employee_id,
       last_name,
       salary,
       ROUND(salary*1.155) AS "New Salary",
       (ROUND(salary*1.155)-salary) AS Increase
FROM employees;

--ex 5
SELECT INITCAP(last_name) name,
       LENGTH(last_name) length
FROM employees
WHERE last_name LIKE 'A%'
OR last_name LIKE 'J%'
OR last_name LIKE 'M%'
ORDER BY last_name;

--ex5a
SELECT INITCAP(last_name) name,
       LENGTH(last_name) length
FROM employees
WHERE last_name LIKE UPPER( '&lit%')
ORDER BY last_name;

--ex6
SELECT last_name,
       ROUND(MONTHS_BETWEEN(sysdate,hire_date)) months_worked
FROM employees
ORDER BY 2;

--ex7
SELECT last_name,
       lpad(salary,15,'$') as Salary
FROM employees;
       
--ex8
SELECT last_name,
       lpad('*',salary/1000,'*') as employees_and_their_salaries
FROM employees
ORDER BY salary DESC;

--ex9
SELECT last_name,
       TRUNC((sysdate-hire_date)/7) as TENURE
FROM employees
WHERE department_id=90
ORDER BY 2 desc;
       


