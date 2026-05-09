# 🚗 Vehicle Rental Management System (SQL)

## 📌 Project Overview
This project features a comprehensive **Vehicle Rental Management System** powered by **PostgreSQL**. It is designed to demonstrate proficiency in relational database design, data integrity, and complex query optimization. The system provides a structured backend to manage users, a diverse fleet of vehicles, and the end-to-end booking process.

---

## ✨ Key Features
*   **Role-Based Access:** Categorizes users into Admins and Customers for secure data management.
*   **Fleet Management:** Tracks various vehicle types (Cars, Bikes, Trucks) with real-time availability updates.
*   **Transaction Tracking:** Manages the full lifecycle of a rental booking, from initial request to completion.
*   **Data Analytics:** Utilizes advanced SQL to extract insights such as rental trends and revenue.

---

## 🗄️ Database Schema

### 1. Users Table
*Manages authentication and user roles.*
*   **`id`**: `UUID` (Primary Key)
*   **`user_name` & `user_email`**: Basic profile information.
*   **`user_role`**: Defined as either `Admin` or `Customer`.

### 2. Vehicles Table
*Tracks the inventory and status of the fleet.*
*   **`id`**: `UUID` (Primary Key)
*   **`vehicle_type`**: Supports multiple categories (`Car`, `Bike`, `Truck`).
*   **`registration_number`**: Ensured via **Unique Constraints**.
*   **`availability_status`**: Monitors if a vehicle is `Available`, `Rented`, or `Under Maintenance`.

### 3. Booking Table
*Records rental transactions and links users to vehicles.*
*   **`id`**: `UUID` (Primary Key)
*   **`user_id` & `vehicle_id`**: **Foreign Keys** establishing relational links.
*   **`rent_start_date` & `rent_end_date`**: Defines the rental period.
*   **`booking_status`**: Tracks progress (`Pending`, `Confirmed`, `Completed`, `Cancelled`).

---

## 🛠️ Technical Skills Demonstrated
This implementation showcases a deep understanding of core and advanced SQL concepts:

*   **Relational Design:** Effective use of Primary/Foreign Keys and `CHECK` constraints to ensure data validity.
*   **Advanced Querying:** Implementation of **Relational Joins** to merge data across multiple tables.
*   **Data Aggregation:** Using `GROUP BY`, `HAVING`, and `COUNT` for statistical reporting.
*   **Logic Optimization:** Utilizing `EXISTS` / `NOT EXISTS` and **Subqueries** for precise data filtering.

---

## 📁 Repository Structure
*   **`README.md`**: Project documentation and overview.
*   **`answers.sql`**: The main SQL script containing schema creation, data insertion, and analytical queries.

---

## 🚀 How to Run
To set up the database and see the queries in action:
1.  Open your preferred database management tool (e.g., **Beekeeper Studio** or **pgAdmin 4**).
2.  Connect to your PostgreSQL instance.
3.  Open the `answers.sql` file.
4.  **Run the script.** 
    > **Note:** Ensure you run the file in order from top to bottom to maintain the structural hierarchy (**Table Creation** → **Data Insertion** → **Queries**).
