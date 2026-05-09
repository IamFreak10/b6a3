
create database b6a2;
create type user_role as enum('admin','customer');


create table users(
  user_id serial primary key,
  name varchar(50) ,
  email varchar(50) unique ,
  phone varchar(11),
  role user_role default 'Customer '
  
);

create type vehicle_availabilty as enum('available','rented','maintenance')
  create table vehicles(
    vehicle_id serial primary key,
    name varchar(50),
    type varchar(50),
    model int,
    registration_number varchar(50) unique,
    rental_price decimal,
    status vehicle_availabilty default 'available'
    
    
  );

create type vehicle_booking_status as enum('completed','confirmed','pending');
create table bookings(
  booking_id serial primary key,
  user_id serial references users(user_id) on delete cascade,
  vehicle_id serial references vehicles(vehicle_id) on delete cascade,
  start_date date,
  end_date date,
  status vehicle_booking_status,
  total_cost decimal
  
);


insert into users (name, email, phone, role) values
('alice', 'alice@example.com', '1234567890', 'customer'),
('bob', 'bob@example.com', '0987654321', 'admin'),
('charlie', 'charlie@example.com', '1122334455', 'customer');

-- vehicles table input
insert into vehicles (name, type, model, registration_number, rental_price, status) values
('toyota corolla', 'car', 2022, 'abc-123', 50, 'available'),
('honda civic', 'car', 2021, 'def-456', 60, 'rented'),
('yamaha r15', 'bike', 2023, 'ghi-789', 30, 'available'),
('ford f-150', 'truck', 2020, 'jkl-012', 100, 'maintenance');

-- bookings table input
insert into bookings (user_id, vehicle_id, start_date, end_date, status, total_cost) values
(1, 2, '2023-10-01', '2023-10-05', 'completed', 240),
(2, 2, '2023-11-01', '2023-11-03', 'completed', 120),
(3, 2, '2023-12-01', '2023-12-02', 'confirmed', 60),
(1, 1, '2023-12-10', '2023-12-12', 'pending', 100);

-- Query 1: JOIN
-- Requirement: Retrieve booking information along with Customer name and Vehicle name.
select 
    bookings.booking_id, 
    users.name as customer_name, 
    vehicles.name as vehicle_name, 
    bookings.start_date, 
    bookings.end_date, 
    bookings.status 
from users 
inner join bookings on users.user_id = bookings.user_id 
inner join vehicles on bookings.vehicle_id = vehicles.vehicle_id;


-- Query 2: EXISTS
-- Requirement: Find all vehicles that have never been booked.


select * from vehicles where  not status='rented'

-- Query 3: WHERE
-- Requirement: Retrieve all available vehicles of a specific type (e.g. cars).

select * from vehicles where type='car'


-- Query 4: GROUP BY and HAVING
-- Requirement: Find the total number of bookings for each vehicle and display only those vehicles that have more than 2 bookings.

select
  name as "vehicle_name",
  count(b.booking_id) as total_bookings
  from vehicles v
  inner join bookings b on 
  v.vehicle_id=b.vehicle_id 
  group by v.name
having count(b.booking_id)>2;