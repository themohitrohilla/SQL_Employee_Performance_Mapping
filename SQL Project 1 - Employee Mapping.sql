# Task 1: Create Database employee and import tables
create database employee;

/*Task 3: Write a query to fetch EMP_ID, FIRST_NAME, LAST_NAME, GENDER, and DEPARTMENT 
from the employee record table, and make a list of employees and details of their department.
*/
Use employee;
select * from emp_record_table;
select EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT from emp_record_table;

/* Task 4: Write a query to fetch EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPARTMENT, and EMP_RATING if the EMP_RATING is: 
•	less than two
•	greater than four 
•	between two and four
*/
select EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT, EMP_RATING from emp_record_table where EMP_RATING<2;
select EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT, EMP_RATING from emp_record_table where EMP_RATING>4;
select EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT, EMP_RATING from emp_record_table where EMP_RATING>2 and emp_rating<4;

/* Task 5:Write a query to concatenate the FIRST_NAME and the LAST_NAME of employees in the Finance department 
from the employee table and then give the resultant column alias as NAME.
*/
select FIRST_NAME, LAST_NAME, concat(FIRST_NAME," ",LAST_NAME) as NAME from emp_record_table WHERE DEPT="Finance";

/* Task 6: Write a query to list only those employees who have someone reporting to them. 
Also, show the number of reporters (including the President).
*/
select manager_id, count(*)
from emp_record_table
group by manager_id
order by manager_id;

/* Write a query to list down all the employees from the healthcare and finance departments using union. 
Take data from the employee record table.
*/
select * from emp_record_table where dept="Healthcare" union 
select * from emp_record_table where dept="finance";

/* Task 8.	Write a query to list down employee details such as EMP_ID, FIRST_NAME, LAST_NAME, ROLE, DEPARTMENT, and EMP_RATING grouped by dept. 
Also include the respective employee rating along with the max emp rating for the department.
*/
#Window function
select * from emp_record_table;
select EMP_ID, FIRST_NAME, LAST_NAME, DEPT, ROLE, EMP_RATING,
max(emp_rating) over (partition by dept) as MAX_RATING from emp_record_table;

select EMP_ID, FIRST_NAME, LAST_NAME, DEPT, ROLE, EMP_RATING,
max(emp_rating) over (partition by ROLE) as MAX_RATING from emp_record_table;

/* Task 9. Write a query to calculate the minimum and the maximum salary of the employees in each role. Take data from the employee record table.
*/
select role, min(Salary) as Min_Salary,
max(salary) as Max_Salary from emp_record_table group by role;

/* Task 10.	Write a query to assign ranks to each employee based on their experience. Take data from the employee record table.
*/
select emp_id, first_name, last_name, exp, 
dense_rank() over (order by exp desc) as experience from emp_record_table;

/* Task 11.	Write a query to assign ranks to each employee based on their experience. Take data from the employee record table.
*/
CREATE VIEW High_Salary_Employees AS
SELECT EMP_ID, FIRST_NAME, LAST_NAME, SALARY, COUNTRY
FROM emp_record_table
WHERE SALARY > 6000;

select * from high_salary_employees;

/* Task 12.	Write a nested query to find employees with experience of more than ten years. Take data from the employee record table
*/

select * from emp_record_table;
select emp_id, first_name, last_name, exp from emp_record_table where exp>"10";

/* Task: 13: Write a query to create a stored procedure to retrieve the details of the employees whose experience is more than three years.
Take data from the employee record table.
*/
delimiter &&
CREATE DEFINER=`root`@`localhost` PROCEDURE `new_procedure`()
BEGIN
select emp_id, first_name, last_name, exp from emp_record_table where exp>"3";
END &&

/* Task: 14.	Write a query using stored functions in the project table to check whether the job profile assigned
 to each employee in the data science team matches the organization’s set standard.
 
The standard being:
For an employee with experience less than or equal to 2 years assign 'JUNIOR DATA SCIENTIST',
For an employee with the experience of 2 to 5 years assign 'ASSOCIATE DATA SCIENTIST',
For an employee with the experience of 5 to 10 years assign 'SENIOR DATA SCIENTIST',
For an employee with the experience of 10 to 12 years assign 'LEAD DATA SCIENTIST',
For an employee with the experience of 12 to 16 years assign 'MANAGER'.
*/
DELIMITER $$
USE `employee`$$
CREATE PROCEDURE `new_desig` ()
BEGIN
select *, case
when exp<="2" then "JUNIOR DATA SCIENTIST"
when exp between 2 and 5 then "ASSOCIATE DATA SCIENTIST"
when exp between 5 and 10 then "SENIOR DATA SCIENTIST"
when exp between 10 and 12 then "LEAD DATA SCIENTIST"
when exp between 12 and 16 then "MANAGER"
END as new_designation from emp_record_table;
END$$


/*Task 15: Create an index to improve the cost and performance of the query to find the employee 
whose FIRST_NAME is ‘Eric’ in the employee table after checking the execution plan.
*/
create index i1 on emp_record_table(first_name(20));
select * from emp_record_table where first_name="ERIC";

/*Task 15: Create a query to calculate the bonus for all the employees, based on their ratings 
and salaries (Use the formula: 5% of salary * employee rating).
*/

select * from emp_record_table;
select *, case
when exp<="2" then "JUNIOR DATA SCIENTIST"
when exp between 2 and 5 then "ASSOCIATE DATA SCIENTIST"
when exp between 5 and 10 then "SENIOR DATA SCIENTIST"
when exp between 10 and 12 then "LEAD DATA SCIENTIST"
when exp between 12 and 16 then "MANAGER"
END as new_designation from emp_record_table;
