# Homeaffairs Database

#Project Description
- This project is a database schema for a Home Affairs Management System.
- It is designed to manage citizens' applications, bookings, and document submissions for services such as ID cards, passports, marriage certificates, and birth certificates.
- The database includes tables for citizens, offices, applications, application documents, bookings, and status tracking. It also includes inserting  data and queries to demonstrate functionality.

#Features
1. Citizens Table: Stores personal details of citizens.
2. Offices Table: Stores information about Home Affairs offices.
3. Applications Table: Tracks applications submitted by citizens for various services.
4. ApplicationDocuments Table: Manages documents uploaded for applications.
5. Bookings Table: Tracks appointments made by citizens at specific offices.
6. StatusChecking Table: Tracks the status of applications.

# How to Set Up and Run the Project:
  1. Install a MySQL client tool (e.g., MySQL Workbench or DBeaver).

 2. Steps to Set Up:
   - Open your MySQL client tool.
   - Create a new connection to your MySQL server.
   - Open the provided SQL file (`answers.sql`) in your client tool.
   - Execute the script to:
     - Create the `home_affairs` database.
     - Create all necessary tables.
     - Insert sample data into the tables.

3. How to Run Queries:
   - Use the provided queries at the end of the script to:
     - Fetch all citizens with their applications.
     - Fetch all bookings for a specific office.
     - Check the status of a specific application.

4. Testing the Database:
   - Modify the sample data or add new data using `INSERT` statements.
   - Run the queries to verify the relationships and data integrity.

5. ERD:
   - Use MySQL Workbench tool to generate an ERD for better visualization.
  
