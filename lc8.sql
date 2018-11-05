--USING SUBQUERIS
Select *
From employees
Where hire_date>(Select hire_date
                  From employees
                  Where last_name ='Davies'); --acesta e un subquery folosit pu I select
                  
Select *
From employees
Where hire_date IN (Select hire_date
                    From employees
                    Where first_name ='Peter'); --acesta e un subquery folosit pu I select
                    
Select job_id, 
       salary,
       last_name
From employees
Where job_id=(Select job_id
              From employees
              Where last_name='Taylor'
              AND first_name='Winston')
AND salary> (Select salary
             From employees
             Where last_name='Taylor'
             AND first_name='Winston'); --conditie dubla implusa prin subquery
             
Select *
From employees
Where salary < (Select AVG(salary)
                From employees
                Where department_id=80)
And department_id=80;  --vedem care angajati din dep 80 au salar mai mic ca media salariu pe dep 80

Select department_id,
       min(salary),
       count(employee_id)
From employees
Group By department_id
Having Min(salary)>(Select min(salary)
                   From employees
                   Where department_id=80); --ne arata departamentele care au salariu min mai mare ca dep 80
                   
Select *
From employees
Where salary IN (Select MIN(salary)
                 From employees
                 Group By department_id);
                 
Select *
From jobs
Where job_title='Architect';
                   
Select *
From employees
Where salary < ANY (Select salary
               From employees
               Where job_id='IT_PROG')
AND job_id <> 'IT_PROG'; --el cauta orice valoare care corespunde cel putin unuia din rezultate
               
Select *
From employees
Where salary < ALL (Select salary
               From employees
               Where job_id='IT_PROG')
AND job_id <> 'IT_PROG'; --el cauta orice valoare care corespunde conditiei la toate rezultatele

Select *
From employees
Where salary IN(Select salary
               From employees
               Where job_id='IT_PROG')
AND job_id <> 'IT_PROG'; --el cauta toate valorile care corespund intocmai rezultatelor
               
Select *
From employees
Where salary <> ALL (Select salary
               From employees
               Where job_id='IT_PROG')
AND job_id <> 'IT_PROG';   --diferit de all

--Multiple Column Subqueries se face doar cu IN
Select last_name, department_id, salary
From employees
Where (salary, department_id) IN (Select min(salary),department_id
                               From employees
                               Group By department_id); --(analizeaza mai multe coloane, trebu scrise in aceeasi ordine)
                               
Select *
From employees
Where employee_id NOT IN (Select manager_id
                      From employees); -- operatorul NOT IN nu lucreaza daca este o valoare NULL

Select *
From employees
Where employee_id NOT IN (Select manager_id
                          From employees
                          Where manager_id IS NOT NULL); 
                          
--Tema pu acasa
--ex1
Select last_name, hire_date
From employees
Where department_id=(Select department_id
                     From employees
                     Where last_name='&nume')
And last_name <> '&nume';

--ex2
Select employee_id,
       last_name,
       salary
From employees
Where salary> (Select avg(salary)
               From employees)
Order By 3;

--ex3
Select employee_id, last_name
From employees
Where department_id IN (Select department_id
                     From employees
                     Where last_name like '%u%');
                     
--ex4
Select last_name, department_id, job_id
From employees
Where department_id in (Select department_id
                     From departments
                     Where location_id=1700);
                     
--b)
Select last_name, department_id, job_id
From employees
Where department_id in (Select department_id
                     From departments
                     Where location_id like '&id');
            
--ex5
Select last_name,
       salary
From employees
Where manager_id in (Select employee_id
                  From employees
                  Where last_name='King');
                  
--ex6
Select department_id, last_name, job_id
From employees
Where department_id=(Select department_id
                     From departments
                     Where department_name='Executive');
                     
--ex7
Select last_name
From employees
Where salary > ANY (Select salary
                    From employees
                    Where department_id=60);
                    
--ex8
Select employee_id,
       last_name,
       salary
From employees
Where salary> (Select avg(salary)
               From employees)
AND department_id IN(Select department_id
                     From employees
                     Where last_name like '%u%');

                    
                     
                
                
 
                 
