-- Create the database
CREATE DATABASE home_affairs;

-- Use  home-affairs database
USE home_affairs;

-- Create Citizens table
CREATE TABLE Citizens (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    surname VARCHAR(100) NOT NULL,
    id_number VARCHAR(13) NOT NULL UNIQUE,
    date_of_birth DATE NOT NULL,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Offices table
CREATE TABLE Offices (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(255) NOT NULL,
    contact_number VARCHAR(15),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Applications table
CREATE TABLE Applications (
    id INT AUTO_INCREMENT PRIMARY KEY,
    citizen_id INT NOT NULL,
    office_id INT NOT NULL,
    application_type ENUM('ID', 'Passport', 'Marriage Certificate', 'Birth Certificate') NOT NULL,
    application_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('Pending', 'Approved', 'Rejected') DEFAULT 'Pending',
    FOREIGN KEY (citizen_id) REFERENCES Citizens(id) ON DELETE CASCADE,
    FOREIGN KEY (office_id) REFERENCES Offices(id) ON DELETE CASCADE
);

-- Create ApplicationDocuments table
CREATE TABLE ApplicationDocuments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    application_id INT NOT NULL,
    document_name VARCHAR(255) NOT NULL,
    document_path VARCHAR(255) NOT NULL,
    uploaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (application_id) REFERENCES Applications(id) ON DELETE CASCADE
);

-- Create Bookings table
CREATE TABLE Bookings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    citizen_id INT NOT NULL,
    office_id INT NOT NULL,
    booking_date DATE NOT NULL,
    status ENUM('Pending', 'Confirmed', 'Cancelled') DEFAULT 'Pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (citizen_id) REFERENCES Citizens(id) ON DELETE CASCADE,
    FOREIGN KEY (office_id) REFERENCES Offices(id) ON DELETE CASCADE
);

-- Create StatusChecking table
CREATE TABLE StatusChecking (
    id INT AUTO_INCREMENT PRIMARY KEY,
    application_id INT NOT NULL,
    status ENUM('Pending', 'In Progress', 'Completed') DEFAULT 'Pending',
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (application_id) REFERENCES Applications(id) ON DELETE CASCADE
);

-- Insert  data into Citizens table
INSERT INTO Citizens (name, surname, id_number, date_of_birth, gender) VALUES
('John', 'Doe', '1234567890123', '1990-01-01', 'Male'),
('Jane', 'Smith', '9876543210987', '1985-05-15', 'Female');

-- Insert  data into Offices table
INSERT INTO Offices (name, location, contact_number) VALUES
('Main Office', '123 Main St, Cityville', '123-456-7890'),
('Branch Office', '456 Branch Rd, Townsville', '987-654-3210');

-- Insert  data into Applications table
INSERT INTO Applications (citizen_id, office_id, application_type, status) VALUES
(1, 1, 'Passport', 'Pending'),
(2, 2, 'ID', 'Approved');

-- Insert  data into ApplicationDocuments table
INSERT INTO ApplicationDocuments (application_id, document_name, document_path) VALUES
(1, 'Birth Certificate', '/documents/birth_certificate.pdf'),
(2, 'Proof of Residence', '/documents/proof_of_residence.pdf');

-- Insert  data into Bookings table
INSERT INTO Bookings (citizen_id, office_id, booking_date, status) VALUES
(1, 1, '2025-05-10', 'Confirmed'),
(2, 2, '2025-05-15', 'Pending');

-- Insert data into StatusChecking table
INSERT INTO StatusChecking (application_id, status) VALUES
(1, 'In Progress'),
(2, 'Completed');

-- Query to fetch all citizens with their applications
SELECT c.name, c.surname, a.application_type, a.status
FROM Citizens c
JOIN Applications a ON c.id = a.citizen_id;

-- Query to fetch all bookings for a specific office
SELECT b.id, c.name, c.surname, b.booking_date, b.status
FROM Bookings b
JOIN Citizens c ON b.citizen_id = c.id
WHERE b.office_id = 1;

-- Query to check the status of an application
SELECT a.id, c.name, c.surname, sc.status, sc.last_updated
FROM StatusChecking sc
JOIN Applications a ON sc.application_id = a.id
JOIN Citizens c ON a.citizen_id = c.id
WHERE a.id = 1;