--Functiile de Grup

Select SUM(salary) as Total_Salary,
       MIN(salary) as minimum,
       MAX(salary) as maximium,
       AVG(salary) as Media, 
       COUNT(salary) as Numar
FROM employees;

Select SUM(DISTINCT salary) as Total_Salary,
       MIN(DISTINCT salary) as minimum,
       MAX(DISTINCT salary) as maximium,
       AVG(DISTINCT salary) as Media, 
       COUNT(DISTINCT salary) as Numar
FROM employees;

SELECT COUNT(DISTINCT job_id)
FROM employees;

Select DISTINCT SUM(salary) as Total_Salary,
       MIN(salary) as minimum,
       MAX(salary) as maximium,
       AVG(salary) as Media, 
       COUNT(salary) as Numar,
       COUNT(job_id) as job,
       COUNT(DISTINCT job_id) as job,
       MIN(hire_date),
       MAX (hire_date),
       COUNT (*)
FROM employees
WHERE job_id='IT_PROG';

SELECT COUNT(commission_pct),  --- valorile cu null nu le aduna si nu le numara
       COUNT(NVL(commission_pct,0))  -- prin NVL schimbam valorile nule cu zero ca sa fie numarate
FROM employees;

--FILTRE PE GRUPE DE DATE (GRUPAREA)
--de aflat media salariilor pentru fiecare department-id
SELECT (department_id),
       ROUND(AVG (salary))
FROM employees
GROUP BY department_id;

SELECT NVL(department_id,10),
       ROUND(AVG(salary))
FROM employees
GROUP BY NVL(department_id,10); --pu ca gruparea sa contina si departament null care a fost schimbat in 10,
                                --trebuie de pus nvl si la Group BY nu doar la Select
                                
--Gruparea dupa mai multe coloane
SELECT (department_id),
       job_id,
       manager_id,
       ROUND(AVG (salary)),
       MIN(hire_date),
       MAX(salary)
FROM employees
WHERE department_id between 50 and 100
GROUP BY department_id, job_id, manager_id
ORDER BY department_id;

SELECT (department_id),
              job_id,
       ROUND(AVG (salary)),
       MIN(hire_date),
       MAX(salary)
FROM employees
--WHERE (salary)<=9000  -- functiile de grup nu se pun in WHERE, ele se pun doar in HAVING
GROUP BY department_id, job_id
HAVING MAX(salary)<=9000
ORDER BY department_id;




