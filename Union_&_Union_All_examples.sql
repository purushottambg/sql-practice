/**
Union is type of join that allows to fetch  data from multiple select queries
Union removes the duplicate in case of union 
but Union All allows the duplicate records. 

There are some conditions
1. should have same n of columns
2. should have same or compatible data types
3.
*/ 

-- Example 1: UNION vs UNION ALL
-- Get a list of all employees from both locations (without duplicates)
select department from headquarters_employees he
Union  
select department from branch_employees be
;

-- Example 2: Get all employees from the both locations (include duplicates)
select customer_id, first_name, last_name, email, signup_date from customers_union
union all
select employee_id, first_name, last_name, email, hire_date from branch_employees
union all
select employee_id, first_name, last_name, email, hire_date from branch_employees;

show tables;
select * from customers_union;
select * from branch_employees;
select * from headquarters_employees;


select * from headquarters_employees order by salary;
select * from headquarters_employees
order by salary desc limit 3, 2;
