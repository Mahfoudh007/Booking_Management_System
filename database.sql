-- Create the database
CREATE DATABASE booking_system;
USE booking_system;

-- Create the users table
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('user', 'admin') DEFAULT 'user',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create the sevices table
CREATE TABLE sevices (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sevice_name VARCHAR(255) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create the bookings table
CREATE TABLE bookings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    service_id INT NOT NULL,
    booking_date DATE NOT NULL,
    booking_time TIME NOT NULL,
    status ENUM('pending', 'comfirmed', 'cancelled') DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (service_id) REFERENCES sevices(id) ON DELETE CASCADE
);

-- Create the sessions table
CREATE TABLE sessions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    session_token VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);


-- Insert sample data into the users table
INSERT INTO users (name, email, password, role) VALUES
('Admin User', 'admin@example.com', 'hashed_password_for_admin', 'admin'),  
('Test User', 'user@example.com', 'hashed_password_for_user', 'user');      

-- Insert sample data into the services table
INSERT INTO services (service_name, price, description) VALUES
('Service 1', 100.00, 'Description for Service 1'),   
('Service 2', 150.00, 'Description for Service 2'),   
('Service 3', 200.00, 'Description for Service 3');   