USE [FinalProject]
GO
----- INSERT TABLE – BUS

INSERT INTO [dbo].[Bus] ([manufacturer], [Seating_capacity], [maximum_speed], [fuel_type], [fuel_efficiency])
VALUES
('Volvo', 90, 140, 'Diesel', '12 km/l'),
('Mercedes', 100, 180, 'Petrol', '10 km/l'),
('Tata', 70, 120, 'Diesel', '15 km/l'),
('Scania', 50, 130, 'Diesel', '11 km/l'),
('Ashok Leyland', 40, 100, 'Diesel', '13 km/l'),
('MAN', 30, 140, 'Diesel', '9 km/l'),
('Mitsubishi', 35, 110, 'Petrol', '8 km/l'),
('Isuzu', 45, 120, 'Diesel', '10 km/l'),
('Hino', 50, 130, 'Diesel', '11 km/l'),
('Fuso', 40, 110, 'Petrol', '8 km/l');

----- INSERT TABLE – Maintenance

INSERT INTO [dbo].[Maintenence] ([bus_id], [maintenence_date],[cost] ,[remark])
VALUES
(1, '2022-02-15', 100 ,'Engine oil change'),
(2, '2021-12-23', 200,'Air filter replacement'),
(1, '2021-11-10',300 ,'Brake pad replacement'),
(3, '2022-01-07',400 ,'Wheel alignment'),
(5, '2021-10-31',500 ,'Battery replacement'),
(7, '2022-03-05', 100,'Fuel filter replacement'),
(8, '2022-02-01', 200,'Transmission fluid change'),
(6, '2021-09-18',120 ,'Coolant top-up'),
(9, '2021-12-17',350 ,'Suspension repair'),
(4, '2022-03-18', 200,'Oil filter replacement');

----- INSERT TABLE – ACCIDENTS 

INSERT INTO [dbo].[Accidents] ([bus_id], [date_time], [location], [type_of_acc])
VALUES
(1, '2021-10-15', 'Highway A-12', 'Collision with another vehicle'),
(2, '2022-01-08', 'Intersection of Main St. and 5th Ave.', 'Rear-end collision'),
(9, '2022-02-18', 'Parking lot of mall', 'Vehicle hit by shopping cart'),
(4, '2021-12-30', 'Freeway 405', 'Tire blowout'),
(5, '2022-03-01', 'City Centre', 'Pedestrian accident'),
(4, '2021-11-25', 'Residential Area', 'Hit and Run'),
(7, '2022-02-03', 'Toll Booth', 'Vehicle fire'),
(8, '2021-09-12', 'Highway 101', 'Overturned vehicle'),
(3, '2022-03-12', 'Construction Zone', 'Construction Equipment Hit'),
(10,'2021-10-20', 'Highway 25', 'Animal Collision');
(3, '2021-10-14', 'Highway A-12', 'Collision with another vehicle'),
(9, '2022-01-02', 'Intersection of Main St. and 5th Ave.', 'Rear-end collision'),
(2, '2022-02-15', 'Parking lot of mall', 'Vehicle hit by shopping cart'),
(6, '2021-12-12', 'Freeway 405', 'Tire blowout'),
(4, '2022-03-21', 'City Centre', 'Pedestrian accident'),
(4, '2021-11-05', 'Residential Area', 'Hit and Run'),
(8, '2022-02-09', 'Toll Booth', 'Vehicle fire'),
(1, '2021-09-11', 'Highway 101', 'Overturned vehicle'),
(1, '2022-03-17', 'Construction Zone', 'Construction Equipment Hit'),
(9, '2021-10-23', 'Highway 25', 'Animal Collision');


---- INSERT TABLE – City

INSERT INTO [dbo].[City] ([name], [state])
VALUES
('New York City', 'New York'),
('Los Angeles', 'California'),
('Chicago', 'Illinois'),
('Houston', 'Texas'),
('Phoenix', 'Arizona'),
('Philadelphia', 'Pennsylvania'),
('San Antonio', 'Texas'),
('San Diego', 'California'),
('Dallas', 'Texas'),
('San Jose', 'California');

-------INSERT TABLE – Route

INSERT INTO [dbo].[Route] ([distance], [bus_stop], [hours], [Start_City], [End_city])
VALUES
(100, 'Bus Stop 1', 2, 1, 3),
(200, 'Bus Stop 2', 5, 2, 9),
(150, 'Bus Stop 3', 3, 4, 6),
(300, 'Bus Stop 4', 7, 8, 7),
(75, 'Bus Stop 5', 1, 5, 2),
(225, 'Bus Stop 6', 6, 9, 6),
(175, 'Bus Stop 7', 4, 3, 10),
(250, 'Bus Stop 8', 7, 6, 7),
(125, 'Bus Stop 9', 3, 10, 4),
(50, 'Bus Stop 10', 1, 7, 5);

----- Insert Table Tracking

INSERT INTO [dbo].[Tracking] ([bus_id], [route_id], [date])
VALUES
(1, 2, '2022-03-22 09:30:00'),
(2, 3, '2022-03-23 10:00:00'),
(3, 1, '2022-03-24 11:15:00'),
(1, 4, '2022-03-25 12:30:00'),
(2, 5, '2022-03-26 13:45:00'),
(3, 6, '2022-03-27 14:00:00'),
(1, 7, '2022-03-28 15:30:00'),
(2, 8, '2022-03-29 16:15:00'),
(3, 9, '2022-03-30 17:00:00'),
(1, 10, '2022-03-31 18:00:00');

Select * from Tracking

----- Insert Table – Driver

INSERT INTO [dbo].[Driver] (bus_id, name, house_no, street_name, zipcode, phone, license_id, driving_exp)
VALUES 
	(5, 'John Smith', '123 Main St', 'Downtown', 12345, '5551234', '12345ABC', 5),
    (3, 'Jane Doe', '456 Elm St', 'Alston', 12345, '5555678', '67890DEF', 10),
    (10, 'Bob Johnson', '789 Oak St', 'Maldan', 12345, '5559012', '34567GHI', 3),
    (4, 'Sara Lee', '321 Pine St', 'Huntington', 12345, '5553456', '89012JKL', 7),
    (1, 'Tom Jones', '654 Cedar St', 'Park st', 12345, '5557890', '23456MNO', 2),
    (5, 'Alice Smith', '321 Main St', 'Downtown', 12345, '5554321', '54321CBA', 3),
    (2, 'Bob Smith', '654 Elm St', 'Alston', 12345, '5558765', '87654FED', 8),
    (NULL, 'Charlie Johnson', '987 Oak St', 'Maldan', 12345, '5552109', '10987IHG', 1),
    (7, 'Samantha Lee', '456 Pine St', 'Huntington', 12345, '5556543', '54321LKI', 6),
    (6, 'Tim Hanes', '789 Cedar St', 'Park st', 12345, '5550987', '09876ONM', 4),
    (8, 'Emily Kim', '123 Maple St', 'Downtown', 12345, '5557777', '77777AAA', 2),
    (NULL, 'David Johnson', '456 Elm St', 'Alston', 12345, '5555555', '55555BBB', 5),
    (4, 'Erica Lee', '789 Oak St', 'Maldan', 12345, '5553333', '33333CCC', 9),
    (9, 'George Jones', '321 Pine St', 'Huntington', 12345, '5551111', '11111DDD', 3),
    (NULL, 'Felicia Smith', '654 Cedar St', 'Park st', 12345, '5559999', '99999EEE', 7),
    (5, 'Henry Kim', '321 Main St', 'Downtown', 12345, '5558888', '88888FFF', 1),
    (2, 'Isaac Johnson', '654 Elm St', 'Alston', 12345, '5557777', '77777GGG', 4),
    (NULL, 'Jasmine Lee', '987 Oak St', 'Maldan', 12345, '5556666', '66666HHH', 6),
    (7, 'Kevin Hanes', '456 Pine St', 'Huntington', 12345, '5555555', '55555III', 2),
    (6, 'Lisa Kim', '789 Cedar St', 'Park st', 12345, '5554444', '44444JJJ', 8);


----- Insert table Schedule

INSERT INTO [dbo].[Schedule] (route_id, bus_id, departure_time, arrival_time, status) 
VALUES 
	(2, 2, '2023-03-26 08:00:00', '2023-03-26 10:00:00', 'On Time'),
	(4, 3, '2023-03-26 10:30:00', '2023-03-26 12:30:00', 'Late'),
	(5, 4, '2023-03-26 09:00:00', '2023-03-26 11:00:00', 'On Time'),
	(8, 5, '2023-03-26 12:00:00', '2023-03-26 14:00:00', 'Delayed'),
	(7, 6, '2023-03-26 07:00:00', '2023-03-26 09:00:00', 'On Time'),
	(3, 7, '2023-03-26 13:00:00', '2023-03-26 15:00:00', 'Late'),
	(9, 8, '2023-03-26 11:00:00', '2023-03-26 13:00:00', 'Delayed'),
	(10, 9, '2023-03-26 14:00:00', '2023-03-26 16:00:00', 'On Time'),
	(1, 10, '2023-03-26 08:30:00', '2023-03-26 10:30:00', 'Late'),
	(6, 1, '2023-03-26 11:30:00', '2023-03-26 13:30:00', 'On Time');
	
----- Insert table Passenger
INSERT INTO [dbo].[Passenger] (fname, lname, address, street_name, city, state, country, zipcode, phone, emailid, dob, gender, username, [password])
VALUES 
('John', 'Doe', '123 Main St', 'Downtown', 'Boston', 'MA', 'USA', 12345, 5551234123, 'johndoe@email.com', '1990-01-01', 'Male', 'johndoe','PasswordJohnDoe'),
('Jane', 'Smith', '456 Elm St', 'Alston', 'Cambridge', 'MA', 'USA', 12345, 5555678432, 'janesmith@email.com', '1985-05-20', 'Female', 'janedoe', 'PasswordJaneDoe123'),
('Bob', 'Johnson', '789 Oak St', 'Maldan', 'Maldan', 'MA', 'USA', 12345, 5559034212, 'bobjohnson@email.com', '1995-10-12', 'Male', 'bobj', 'PasswordBobJ@345'),
('Sara', 'Lee', '321 Pine St', 'Huntington', 'Newton', 'MA', 'USA', 12345, 5552563456, 'saralee@email.com', '1992-03-15', 'Female', 'saralee','PasswordSaraLee'),
('Tom', 'Jones', '654 Cedar St', 'Park st', 'Boston', 'MA', 'USA', 12345, 5557784890, 'tomjones@email.com', '1988-12-31', 'Male', 'tomj', 'Tomj@123'),
('Maria', 'Garcia', '123 Main St', 'Downtown', 'Boston', 'MA', 'USA', 12345, 5553571111, 'mariagarcia@email.com', '1980-07-10', 'Female', 'mariag','MariaG123'),
('David', 'Johnson', '456 Elm St', 'Alston', 'Cambridge', 'MA', 'USA', 12345, 5552754222, 'davidjohnson@email.com', '1999-02-25', 'Male', 'davidj',  'DavidJones123'),
('Lucy', 'Smith', '789 Oak St', 'Maldan', 'Maldan', 'MA', 'USA', 12345, 5553389433, 'lucysmith@email.com', '1998-06-05', 'Female', 'lucys', 'LucyS12345'),
('James', 'Brown', '321 Pine St', 'Huntington', 'Newton', 'MA', 'USA', 12345, 5550984444, 'jamesbrown@email.com', '1975-11-18', 'Male', 'jamesb', 'Password@123'),
('Linda', 'Davis', '654 Cedar St', 'Park st', 'Boston', 'MA', 'USA', 12345, 5555587555, 'lindadavis@email.com', '1982-09-02', 'Female', 'lindad', 'Pass123');

Select * from Ticket
----- Insert Table Ticket
select * from Route
INSERT INTO [dbo].[Ticket] (passenger_id, route_id ,seat_no, price, booking_date, payment_mode)
VALUES 
    (1, 1,10, 50, '2023-03-28 08:00:00', 'Credit Card'),
    (2,3 ,11, 50, '2023-03-29 08:00:00', 'Debit Card'),
    (3, 1,12, 50, '2023-03-30 08:00:00', 'Cash'),
    (4, 10,13, 50, '2023-03-31 08:00:00', 'Credit Card'),
    (5, 9,14, 50, '2023-04-01 08:00:00', 'Debit Card'),
    (6, 8,15, 50, '2023-04-02 08:00:00', 'Cash'),
    (7,7 ,16, 50, '2023-04-03 08:00:00', 'Credit Card'),
    (8, 6,17, 50, '2023-04-04 08:00:00', 'Debit Card'),
    (9, 1,18, 50, '2023-04-05 08:00:00', 'Cash'),
    ( 10, 5,19, 50, '2023-04-06 08:00:00', 'Credit Card');

------ Insert table - Feedback 

INSERT INTO Feedback (ticket_id, comment, rating) 
VALUES 
(2, 'Great trip!', 5),
(2, 'Bus was a bit late', 3),
(3, 'Comfortable seats', 4),
(4, 'Terrible experience', 1),
(5, 'Driver was very friendly', 4),
(6, NULL, 2),
(7, 'Bus was very clean', 5),
(8, 'Lost my luggage', 2),
(9, 'Good value for the money', 4),
(10, 'Bus was too crowded', 3);

---- Insert table Booking_Details
Select * from Booking_Details
INSERT INTO [dbo].[Booking_Details] ([ticket_id], [date], [payment_status])
VALUES (1, '2023-04-01 08:00:00', 'Incomplete'),
	   (2, '2023-04-02 09:30:00', 'Complete'),
	   (3, '2023-04-03 11:00:00', 'Incomplete'),
	   (4, '2023-04-04 10:00:00','Complete'),
	   (5, '2023-04-05 13:30:00','Complete'),
	   (6, '2023-04-06 15:00:00','Incomplete'),
	   (7, '2023-04-07 12:00:00','Complete'),
	   (8, '2023-04-08 16:30:00','Incomplete'),
	   (9, '2023-04-09 18:00:00','Complete'),
	   (10, '2023-04-10 14:00:00','Complete');

	   Select * from Passenger