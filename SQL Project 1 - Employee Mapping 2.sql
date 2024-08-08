/*Task 15: Create a query to calculate the bonus for all the employees, based on their ratings 
and salaries (Use the formula: 5% of salary * employee rating).
*/

select *, (0.05*salary)*emp_rating as bonus from emp_record_table;

/* Task 17:  Write a query to calculate the average salary distribution based on the continent and country. 
Take data from the employee record table.
*/
SELECT continent, country, AVG(salary) AS avg_salary FROM emp_record_table
GROUP BY continent, country;