CREATE DATABASE IF NOT EXISTS car_rental;
USE car_rental;

CREATE TABLE IF NOT EXISTS Admin (
    admin_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS Car (
    car_id INT AUTO_INCREMENT PRIMARY KEY,
    brand VARCHAR(100) NOT NULL,
    model VARCHAR(100) NOT NULL,
    colour VARCHAR(50) NOT NULL,
	photo VARCHAR(50) NOT NULL,
    plate_number VARCHAR(20) NOT NULL,
    price_per_day DECIMAL(10,2) NOT NULL,
    location VARCHAR(255) NOT NULL,
    gear_type VARCHAR(50) NOT NULL,
    num_seats INT NOT NULL,
    car_type VARCHAR(50) NOT NULL,
    fuel_type VARCHAR(50) NOT NULL,
	admin_id INT NOT NULL,
    FOREIGN KEY (admin_id) REFERENCES Admin(admin_id),
    INDEX (location)
);


CREATE TABLE IF NOT EXISTS Customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Phone VARCHAR(20) NOT NULL,
    DateOfBirth DATE NOT NULL,
    SignupDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS Booking (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    car_id INT,
    customer_id INT,
    pickup_date DATE NOT NULL,
    return_date DATE NOT NULL,
    status VARCHAR(50),
    total_cost DECIMAL(10,2),
    payment_method VARCHAR(50),
    FOREIGN KEY (car_id) REFERENCES Car(car_id),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    CONSTRAINT chk_return_date CHECK (return_date > pickup_date)
);

CREATE TABLE IF NOT EXISTS PaymentHistory (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT,
    amount DECIMAL(10,2) NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id)
);