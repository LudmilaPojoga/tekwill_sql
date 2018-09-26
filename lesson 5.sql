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
