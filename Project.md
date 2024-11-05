# intro to database project
# Digital Mart - E-commerce Platform

Digital Mart is a CRUD-based e-commerce application developed using PostgreSQL, Express/Node.js for the backend, and JavaScript for the frontend. This project demonstrates a robust database-backed web application where users can browse products, manage orders, and access reviews.

## Project Setup

### Database Setup
1. **Database Creation**:
   - The database tables are defined in `create.sql`.
   - Sample data is populated using `insert.sql`, where dummy values were manually inserted for testing purposes.

2. **Database Connection**:
   - Ensure PostgreSQL is running, and create a database instance as specified in `index.js`.
   - In `index.js`, configure your database credentials (`database name`, `username`, `password`) to establish the connection.

### Running the Application
1. **Starting the Server**:
   - Navigate to the project folder and install dependencies:
     ```bash
     npm install
     ```
   - Start the application server:
     ```bash
     node index.js
     ```
   - The server will run on **port 3000** by default.

2. **Accessing the Application**:
   - Open your browser and go to `http://localhost:3000` to access the main site.
   - Use the following routes for specific actions:
     - **Customer Home**: `http://localhost:3000/customer_home`
     - **Admin Home**: `http://localhost:3000/admin_home` for managing customers, products, and other administrative tasks.

## Folder Structure
- **`create.sql`**: Contains SQL statements to set up the database schema.
- **`insert.sql`**: Populates the database tables with manually inserted dummy values.
- **`DMQLWeb`**: Contains both front-end and back-end code for the website.

## Key Features
- **Customer and Admin Interfaces**: Separate views for customer and admin functionalities.
- **CRUD Operations**: Enables admins to perform CRUD actions on orders, customers, products, sellers, and reviews.
- **Predefined SQL Queries**: The admin interface (`admin_home`) includes a "Visualize Query" button, which executes predefined SQL statements. These queries demonstrate complex operations, such as JOINs across multiple tables and subqueries, allowing admins to retrieve joint search results directly from the database.
- **Custom SQL Queries**: The "Visualize Query" functionality also allows admins to execute custom SQL queries directly in the browser for quick insights and data exploration.

## Technology Stack
- **Backend**: Express/Node.js
- **Frontend**: JavaScript, HTML, CSS
- **Database**: PostgreSQL



