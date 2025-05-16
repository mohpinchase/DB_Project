-- Clinic Booking System Database
-- Purpose: Manage patients, doctors, appointments, and medical records
-- Created: May 16, 2025

-- Create Patients table
CREATE TABLE Patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender ENUM('M', 'F', 'Other') NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15) NOT NULL,
    address VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Doctors table
CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    specialty VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15) NOT NULL,
    license_number VARCHAR(20) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Departments table
CREATE TABLE Departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100) NOT NULL,
    location VARCHAR(100) NOT NULL
);

-- Create Doctor_Departments (M-M relationship between Doctors and Departments)
CREATE TABLE Doctor_Departments (
    doctor_id INT,
    department_id INT,
    PRIMARY KEY (doctor_id, department_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id) ON DELETE CASCADE,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id) ON DELETE CASCADE
);

-- Create Appointments table (1-M relationship: Doctor-Patients)
CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATETIME NOT NULL,
    status ENUM('Scheduled', 'Completed', 'Cancelled') DEFAULT 'Scheduled',
    reason VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id) ON DELETE RESTRICT,
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id) ON DELETE RESTRICT,
    UNIQUE (doctor_id, appointment_date) -- Ensures no double-booking
);

-- Create Medical_Records table (1-1 relationship with Appointments)
CREATE TABLE Medical_Records (
    record_id INT PRIMARY KEY AUTO_INCREMENT,
    appointment_id INT NOT NULL,
    diagnosis TEXT NOT NULL,
    treatment_plan TEXT NOT NULL,
    prescription TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id) ON DELETE CASCADE,
    UNIQUE (appointment_id) -- Ensures one record per appointment
);

-- Create Indexes for better query performance
CREATE INDEX idx_patient_email ON Patients(email);
CREATE INDEX idx_doctor_email ON Doctors(email);
CREATE INDEX idx_appointment_date ON Appointments(appointment_date);