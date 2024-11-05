# intro to database project
# Digital Mart - E-commerce Platform

Digital Mart is a CRUD-based e-commerce application developed using PostgreSQL, Node.js for the backend, and JavaScript for the frontend. 
This project demonstrates a robust database-backed web application where users can browse products, manage orders, and access reviews.

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
     - **Customer Login**: `http://localhost:3000/login_customer.html`
     - **Administrator Login**: `http://localhost:3000/login`
   - *Note:* Login details can be found in the respective credentials files.

## Folder Structure
- **`create.sql`**: Contains SQL statements to set up the database schema.
- **`insert.sql`**: Populates the database tables with manually inserted dummy values.
- **`DMQLWeb`**: Contains the front-end files for the website.

## Key Features
- **Customer and Admin Interfaces**: Separate login routes and views for customer and admin roles.
- **CRUD Operations**: Allows users to perform essential CRUD actions across products, orders, and reviews.
- **Real-Time Database Interaction**: Pre-defined SQL queries with JOIN operations enable real-time data retrieval and display on the frontend.

## Technology Stack
- **Backend**: Node.js
- **Frontend**: JavaScript, HTML, CSS
- **Database**: PostgreSQL


