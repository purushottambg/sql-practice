/**
Full Join
Returns all the rows matching rows from both tables  where the join condition is met
also returns all the non-matching rows from the left table(With null values for columns from the right table)
also returns all the non-matching rows from the right table(With null values for columns from the left table)

it combines th results of both LEFT and RIGHT join including all records form both tables and matching records from both sides where available

Simply in case of empoyee and department it'll return on full join

A. Employee table
B. Department table
C. All employees with their departments
D. Employees without their departments  (Null for departments)
E. All departments without employees (Null for employees)


While other joins return

A. INNER JOIN -- only matching rows in tables
B. LEFT JOIN -- only matching rows in LEFT table
C. RIGHT JOIN -- only matching rows in RIGHT table
*/