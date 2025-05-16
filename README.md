 # Clinic Booking System Database
# Overview
The Clinic Booking System Database is a MySQL-based relational database designed to manage the operations of a medical clinic. It handles patient records, doctor profiles, appointment scheduling, medical records, and department assignments. The database is structured with proper constraints (Primary Keys, Foreign Keys, NOT NULL, UNIQUE) and supports one-to-one, one-to-many, and many-to-many relationships to ensure data integrity and efficient querying.
This project serves as a robust foundation for a clinic management application, ensuring no double-booking of appointments and maintaining comprehensive medical records.
Features

1. Patient Management: Stores personal details such as name, date of birth, contact information, and address.
2. Doctor Management: Tracks doctor profiles, including specialties and license numbers.
3. Appointment Scheduling: Manages appointments with constraints to prevent double-booking for doctors.
4. Medical Records: Links detailed diagnoses, treatment plans, and prescriptions to specific appointments.
5. Department Assignments: Supports many-to-many relationships between doctors and departments.
6. Performance Optimization: Includes indexes on frequently queried fields (e.g., email, appointment date).

Technologies Used

* MySQL: Database management system (version 8.0 or higher recommended).
* dbdiagram.io: Used for generating the Entity-Relationship Diagram (ERD).

Setup Instructions
To set up and run the Clinic Booking System Database locally, follow these steps:

Install MySQL:

Ensure MySQL is installed (version 8.0 or higher). Download from MySQL Community Downloads.
Verify installation: mysql --version.


Create the Database:

Log in to MySQL: mysql -u your_username -p.
Create a new database: CREATE DATABASE clinic_booking;.


Import the SQL File:

Import the database schema: mysql -u your_username -p clinic_booking < clinic_booking_system.sql.
Alternatively, copy the contents of clinic_booking_system.sql into a MySQL client (e.g., MySQL Workbench) and execute.


Verify the Setup:

Connect to the database: USE clinic_booking;.
List tables to confirm: SHOW TABLES;.
Check table structures: DESCRIBE table_name; (e.g., DESCRIBE Patients;).


Optional: View the ERD:

Open clinic_booking_erd.dbml in dbdiagram.io to visualize the ERD.
Alternatively, view the screenshot: erd_screenshot.png.



Entity-Relationship Diagram (ERD)
The ERD illustrates the database structure, including tables, attributes, constraints, and relationships. Key relationships include:

One-to-Many: Patients to Appointments, Doctors to Appointments.
One-to-One: Appointments to Medical Records.
Many-to-Many: Doctors to Departments via the Doctor_Departments junction table.

Access the ERD:

Online: View at dbdiagram.io.
Local: See erd_screenshot.png in the repository.

# Repository Structure

├── clinic_booking_system.sql   # MySQL schema file with table definitions
├── erd_screenshot.png          # Screenshot of the ERD
└── README.md                   # Project documentation

Usage
Once the database is set up, you can:

Insert sample data into the tables (e.g., INSERT INTO Patients (first_name, last_name, ...) VALUES (...);).
Query the database for operations like booking appointments or retrieving medical records.
Integrate the database with a frontend or backend application for a complete clinic management system.

# Notes

The clinic_booking_system.sql file is well-commented for clarity and includes indexes for performance.
Ensure foreign key constraints are enabled in MySQL (SET FOREIGN_KEY_CHECKS=1;).
The database is designed to prevent double-booking through a UNIQUE constraint on Appointments(doctor_id, appointment_date).

Contact
For questions or issues, please open an issue on this GitHub repository
