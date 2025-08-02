/**
 IMPORTANT NOTES FOR SELF JOINS:
  1. Always use different aliases for each instance of the table.
  2. When looking for pairs, use conditions like a.id < b.id to avoid matching rows with themselves.
  3. Self JOINs can be resource-intensive. Consider indexing columns used in JOIN conditions.
  4. Consider LEFT JOINs when you need to include records without matches (like employees with no manager).
*/

-- EXAMPLE 1: Basic Self JOIN to show employees with their managers
-- This joins the employees table with itself to match employees with manager information

select e.employee_id, concat(e.first_name,' ',e.last_name) as employee_name, m.employee_id as manager_id, concat(m.first_name,' ',m.last_name) as manager_name, e.job_title, e.department, e.salary
from employees e
join 
employees m
on
e.employee_id=m.manager_id; 

-- EXAMPLE 2: Self JOIN with LEFT JOIN to include all employees (including CEO with no manager)
-- This ensures even employees without managers (like the CEO) are included in results

select e.employee_id, concat(e.first_name,' ',e.last_name) as employee_name, m.employee_id as manager_id, concat(m.first_name,' ',m.last_name) 
as manager_name, e.job_title, e.department, e.salary
from employees e
left join 
employees m
on
e.employee_id=m.manager_id;


-- EXAMPLE 3: Group employees by department
-- Not a self join, but useful for context


-- EXAMPLE 4: Find employees who work in the same department
-- Self join to match employees with their colleagues in the same department
-- The condition e1.employee_id < e2.employee_id prevents duplicates and self-matches


-- EXAMPLE 5: Find employees who make less than their managers
-- Self join to compare employee salaries with their manager's salary


-- EXAMPLE 6: Calculate average salary difference between employees and managers by department
-- This shows how to use aggregate functions with self joins




select * from employees;
