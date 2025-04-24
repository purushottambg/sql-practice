/**
Right Join Queries
*/

-- DEMO: LEFT JOIN to see all apartments and their residents (if any)
SELECT a.apartment_number, a.floor_number, a.wing_name, 
       r.first_name, r.last_name
FROM apartments a
LEFT JOIN residents r
ON r.apartment_id = a.apartment_id
order by a.apartment_number;

-- DEMO: RIGHT JOIN to see all apartments and their residents (if any)
SELECT a.apartment_number, a.floor_number, a.wing_name, 
       r.first_name, r.last_name
FROM residents r 
RIGHT JOIN apartments a
ON r.apartment_id = a.apartment_id
order by a.apartment_number;

-- Find all the unoccupied apartments


-- Count the number of resedents per apartment


-- List all apartments with their residents and maintenance request status


-- write a query to find the floor with the most unoccupied apartments


-- write a query to list all apartments along with the total number of maintenance request