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


