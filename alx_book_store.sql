-- Create the database
CREATE DATABASE IF NOT EXISTS alx_book_store;

-- Use the database

USE alx_book_store;

-- 1. AUTHORS TABLE

CREATE TABLE IF NOT EXISTS Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);

-- 2. BOOKS TABLE

CREATE TABLE IF NOT EXISTS Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT,
    price DOUBLE NOT NULL,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

-- 3. CUSTOMERS TABLE

CREATE TABLE IF NOT EXISTS Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) UNIQUE NOT NULL,
    address TEXT
);

-- 4. ORDERS TABLE

CREATE TABLE IF NOT EXISTS Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- 5. ORDER_DETAILS TABLE

CREATE TABLE IF NOT EXISTS Order_Details (
    orderdetailid INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity DOUBLE NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);


-- SAMPLE DATA (optional for testing)

INSERT INTO Authors (author_name)
VALUES ('Chimamanda Adichie'), ('George Orwell'), ('J.K. Rowling');

INSERT INTO Books (title, author_id, price, publication_date)
VALUES
('Half of a Yellow Sun', 1, 25.99, '2006-09-12'),
('1984', 2, 15.50, '1949-06-08'),
('Harry Potter and the Philosopher''s Stone', 3, 30.00, '1997-06-26');

INSERT INTO Customers (customer_name, email, address)
VALUES
('Israel Nwaminogbe', 'israel@example.com', 'Lagos, Nigeria'),
('Ada Umeh', 'ada@example.com', 'Abuja, Nigeria');

INSERT INTO Orders (customer_id, order_date)
VALUES
(1, '2025-10-23'),
(2, '2025-10-22');

INSERT INTO Order_Details (order_id, book_id, quantity)
VALUES
(1, 1, 2),
(1, 2, 1),
(2, 3, 3);
