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