INSERT INTO users (user_id, full_name, email, password_hash, phone, role, created_at) VALUES
(1, 'Rahul Sharma', 'rahul@example.com', 'hashed_pwd1', '9876543210', 'CUSTOMER', NOW()),
(2, 'Anjali Mehta', 'anjali@example.com', 'hashed_pwd2', '8765432109', 'CUSTOMER', NOW()),
(3, 'Amit Verma', 'amit@example.com', 'hashed_pwd3', '7654321098', 'ADMIN', NOW()),
(4, 'Priya Singh', 'priya@example.com', 'hashed_pwd4', '9988776655', 'CUSTOMER', NOW()),
(5, 'Vikram Rao', 'vikram@example.com', 'hashed_pwd5', '7788996655', 'CUSTOMER', NOW()),
(6, 'Sneha Joshi', 'sneha@example.com', 'hashed_pwd6', '9988771122', 'CUSTOMER', NOW()),
(7, 'Kunal Roy', 'kunal@example.com', 'hashed_pwd7', '8877665544', 'CUSTOMER', NOW()),
(8, 'Pooja Desai', 'pooja@example.com', 'hashed_pwd8', '8899001122', 'CUSTOMER', NOW()),
(9, 'Rohan Das', 'rohan@example.com', 'hashed_pwd9', '9988223344', 'CUSTOMER', NOW()),
(10, 'Isha Khan', 'isha@example.com', 'hashed_pwd10', '8877553322', 'CUSTOMER', NOW());

-- address details

INSERT INTO addresses (address_id, user_id, address_line1, address_line2, city, state, postal_code, country, is_default) VALUES
(1, 1, '123 MG Road', '', 'Pune', 'MH', '411001', 'India', TRUE),
(2, 2, '45 Ring Road', 'Apt 3B', 'Mumbai', 'MH', '400001', 'India', TRUE),
(3, 3, '77 Residency', 'Block A', 'Delhi', 'DL', '110001', 'India', TRUE),
(4, 4, 'Plot 88', '', 'Bangalore', 'KA', '560001', 'India', TRUE),
(5, 5, 'Sector 21', '', 'Noida', 'UP', '201301', 'India', TRUE),
(6, 1, '456 Market Street', '', 'Nashik', 'MH', '422001', 'India', FALSE);

-- categories
INSERT INTO categories (category_id, name, parent_id) VALUES
(1, 'Electronics', NULL),
(2, 'Books', NULL),
(3, 'Clothing', NULL),
(4, 'Mobiles', 1),
(5, 'Laptops', 1);

-- insert products
INSERT INTO products (product_id, name, description, price, category_id, brand, created_at) VALUES
(1, 'iPhone 13', 'Apple smartphone with A15 chip', 69999.00, 4, 'Apple', NOW()),
(2, 'MacBook Pro', 'Apple laptop with M2 chip', 149999.00, 5, 'Apple', NOW()),
(3, 'The Alchemist', 'Famous book by Paulo Coelho', 499.00, 2, 'HarperCollins', NOW()),
(4, 'Men’s T-Shirt', '100% cotton round-neck', 799.00, 3, 'H&M', NOW()),
(5, 'Samsung Galaxy S21', 'Flagship Android phone', 59999.00, 4, 'Samsung', NOW());

-- inventory
INSERT INTO inventory (inventory_id, product_id, quantity_available, last_updated) VALUES
(1, 1, 50, NOW()),
(2, 2, 30, NOW()),
(3, 3, 200, NOW()),
(4, 4, 100, NOW()),
(5, 5, 40, NOW());

-- orders 
INSERT INTO orders (order_id, user_id, address_id, order_status, order_date, total_amount) VALUES
(1, 1, 1, 'CONFIRMED', NOW(), 69999.00),
(2, 2, 2, 'SHIPPED', NOW(), 149999.00),
(3, 1, 6, 'DELIVERED', NOW(), 499.00);


-- order items
INSERT INTO order_items (order_item_id, order_id, product_id, quantity, price_per_unit) VALUES
(1, 1, 1, 1, 69999.00),
(2, 2, 2, 1, 149999.00),
(3, 3, 3, 1, 499.00);

-- payments
INSERT INTO payments (payment_id, order_id, payment_method, payment_status, transaction_id, payment_date) VALUES
(1, 1, 'CARD', 'SUCCESS', 'TXN123456', NOW()),
(2, 2, 'UPI', 'SUCCESS', 'TXN234567', NOW()),
(3, 3, 'COD', 'PENDING', 'TXN345678', NOW());

-- Reviews
INSERT INTO reviews (review_id, user_id, product_id, rating, comment, created_at) VALUES
(1, 1, 1, 5, 'Amazing phone!', NOW()),
(2, 2, 2, 4, 'Great performance!', NOW()),
(3, 1, 3, 5, 'Loved the book!', NOW());


-- wishlist
INSERT INTO wishlists (wishlist_id, user_id, product_id, added_at) VALUES
(1, 1, 5, NOW()),
(2, 2, 4, NOW()),
(3, 3, 1, NOW());
