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


-- Example 3: Combine all the possible tables 
select * from branch_employees 
union all 
select * from headquarters_employees; 

-- Example 4: combine tables and add the description columns for additional details.  
select *, 'Branch_Level_Staff' as Branch_Staff from branch_employees 
union all 
select *, 'HQ_Level_Staff' as Branch_Staff from headquarters_employees; 

-- Example 4: Ordering results after UNION
-- Get all employees sorted by last name

select employee_id, first_name, last_name, email, hire_date, 'Branch Worked' as Branchers_or_HQs from branch_employees  
Union
select employee_id, first_name, last_name, email, hire_date, 'HQ workers' as Branchers_or_HQs from headquarters_employees
order by last_name;

-- Example 5: Filtering before UNION, add required clauses individually(before union/union all keywords in query)
-- Get employees with salary over 70000

select employee_id, first_name, last_name, email, hire_date,   'Branch takers' as Location  from branch_employees
where salary>2000  
union
select employee_id, first_name, last_name, email, hire_date,   'HQ Malik' as Location from headquarters_employees
where salary>2000 ;

-- Handling Different Column Structures
-- ====================================================================
-- Example 6: Handling different table structures with NULL values
-- If tables do not have all the columns compatible or identicle, then we can select only compatible types
-- Or we can place a null there

select customer_id as ID, first_name, last_name, email, signup_date, null as hire_date, 'customers' as Type_of_persons from customers_union
union
select employee_id as ID, first_name, last_name, email, null as signup_date, hire_date, 'Branchers' as Type_of_persons from branch_employees
union
select employee_id as ID, first_name, last_name, email, null as signup_date, hire_date, 'HQUers' as Type_of_persons from headquarters_employees
order by id;

-- Practical Use Cases
-- ====================================================================
-- Example 7: Finding all unique departments across locations

select distinct(department) from branch_employees
union
select distinct(department) from headquarters_employees;


-- Example 8: Finding common departments (advanced)
-- Departments that exist in both headquarters and branch offices

select  department from  
(
select distinct(department) as department from branch_employees
union all
select distinct(department) as department from headquarters_employees
) as common_departments
group by department having count(*)>1;

show tables;
select * from customers_union;
select * from branch_employees;
select * from headquarters_employees;


select * from headquarters_employees order by salary;
select * from headquarters_employees
order by salary desc limit 3, 2;
