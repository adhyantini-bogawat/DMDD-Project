USE [master]

IF EXISTS (SELECT name FROM sys.databases WHERE name = N'FinalProject')
    DROP DATABASE FinalProject
GO

CREATE DATABASE [FinalProject]
go
USE [FinalProject]
GO
---- CREATE TABLE - BUS

CREATE TABLE [dbo].[Bus](
	[bus_id] [int] NOT NULL IDENTITY(1,1),
	[manufacturer] [varchar](50) NOT NULL,
	[Seating_capacity] [int] CONSTRAINT Seat_Cap CHECK (Seating_capacity > 0),
	[maximum_speed] [int], 	 	 
	[fuel_type] [varchar](50),
	[fuel_efficiency] [varchar](50),
	CONSTRAINT Bus_PK  PRIMARY KEY (bus_id)
) ON [PRIMARY]
GO

---- CREATE TABLE - Maintenance

CREATE TABLE [dbo].[Maintenence](
	[maintenence_id] [int] NOT NULL IDENTITY(1,1),
	[bus_id] [int] NOT NULL,
	[maintenence_date] [date],
	[cost] [int] NOT NULL,
	[remark] [varchar](50),
	CONSTRAINT Maintenence_PK  PRIMARY KEY (maintenence_id),
	CONSTRAINT  Maintenence_FK FOREIGN KEY (bus_id) 
			references Bus(bus_id)
) ON [PRIMARY]
GO

----CREATE TABLE - Accidents

CREATE TABLE [dbo].[Accidents](
	[bus_id] [int] NOT NULL,
	[date_time] [Date] NOT NULL,
	[location] [varchar](50),
	[type_of_acc] [varchar](50),
 CONSTRAINT Accidents_PK  PRIMARY KEY (bus_id,date_time ),
 CONSTRAINT  Accidents_FK FOREIGN KEY (bus_id) 
			references bus(bus_id)
 ) ON [PRIMARY]
GO

---- CREATE TABLE - City

CREATE TABLE [dbo].[City](
	[city_id] [int] NOT NULL IDENTITY(1,1),
	[name] [char](56) NOT NULL,
	[state] [varchar](50) NULL,
	CONSTRAINT City_PK  PRIMARY KEY (city_id),
) ON [PRIMARY]
GO

---- CREATE TABLE Route

CREATE TABLE [dbo].[Route](
	[route_id] [int] NOT NULL IDENTITY(1,1),
	[distance] [int],
	[bus_stop] [varchar](20) NOT NULL,
	[hours] [int] ,
	[Start_City] [int],
	[End_city][int],
	CONSTRAINT CHK_ROUTE CHECK (distance > 0 AND hours > 0),
	CONSTRAINT Route_PK  PRIMARY KEY (route_id),
       CONSTRAINT Start_City FOREIGN KEY(Start_City) references City(city_id),
       CONSTRAINT End_city FOREIGN KEY(End_city) references City(city_id)
) ON [PRIMARY]
GO

---- Create Table – Tracking

CREATE TABLE [dbo].[Tracking](
	[tracking_id] [int] NOT NULL IDENTITY(1,1),
	[bus_id] [int] NOT NULL,
	[route_id] [int] NOT NULL,
	[date] [datetime] ,
	CONSTRAINT Tracking_PK  PRIMARY KEY (tracking_id),
	CONSTRAINT Tracking_FK1 FOREIGN KEY (route_id) 
			references Route(route_id),
	CONSTRAINT Tracking_FK2 FOREIGN KEY (bus_id) 
			references Bus(bus_id),
) ON [PRIMARY]
GO

---- Create Table - Driver

--- UDF  ------
-- To compute age based on date of birth of driver ----

CREATE FUNCTION dbo.CalculateDriverAge 
( 
	@dob datetime
) 
RETURNS int	 
AS 
BEGIN 
    DECLARE @age int 
    SET @age = DATEDIFF(hour,@dob,GETDATE())/8766.0
    RETURN @age
END


CREATE TABLE [dbo].[Driver](
	[driver_id] [int] NOT NULL IDENTITY (1,1),
	[bus_id] [int] ,
	[name] [varchar](50) NOT NULL,
	[house_no] [varchar](50) ,
	[street_name] [varchar](50) ,
	[zipcode] [int],
	[phone] [int],
	[dob] [date],
	age AS dbo.CalculateDriverAge(dob),
	[license_id] [varchar](20),
	[driving_exp] [int],
	CONSTRAINT Driver_PK  PRIMARY KEY (driver_id),
	CONSTRAINT  Driver_FK2 FOREIGN KEY (bus_id) 
			references Bus(bus_id),
) ON [PRIMARY]
GO

---- Create table – Schedule

CREATE TABLE [dbo].[Schedule](
	[schedule_id] [int] NOT NULL IDENTITY(1,1),
	[route_id] [int] NOT NULL,
	[bus_id] [int] NOT NULL,
	[departure_time] [datetime],
	[arrival_time] [datetime],
	[status] [varchar](15),
	CONSTRAINT Schedule_PK  PRIMARY KEY (schedule_id),
	CONSTRAINT  Schedule_FK1 FOREIGN KEY (route_id) 
			references Route(route_id),
	CONSTRAINT  Schedule_FK2 FOREIGN KEY (bus_id) 
			references Bus(bus_id)
) ON [PRIMARY]
GO

---- Create Table - Passenger

CREATE TABLE [dbo].[Passenger]( 
	[passenger_id] [int] NOT NULL IDENTITY(1,1), 
	[fname] [varchar](50) NOT NULL, 
	[lname] [varchar](50) NOT NULL, 
	[address] [varchar](50), 
	[street_name] [varchar](50) , 
	[city] [varchar](25), 
	[state] [varchar](25),
	[country] [varchar](25),
	[zipcode] [int] CONSTRAINT chk_zipcode CHECK (LEN(zipcode) = 5),
	[phone] [bigint] UNIQUE CONSTRAINT Ph_length_check CHECK  (len([phone])=10), 
	[emailid] [varchar](100) CONSTRAINT email_check CHECK (emailid LIKE '[a-z,0-9,_,-]%@[a-z]%.[a-z][a-z]%'), 
	[dob] [datetime], 
	[gender] [char] (6),
	[username] [varchar](50),
    [password] [varchar](400)
	CONSTRAINT Passenger_PK  PRIMARY KEY (passenger_id), 
) ON [PRIMARY]
Go

---- Create Table - Ticket

CREATE TABLE [dbo].[Ticket](
	[ticket_id] [int] NOT NULL IDENTITY(1,1),
	[passenger_id] [int] NOT NULL,
	[route_id] [int] NOT NULL,
 	[seat_no] [int] NOT NULL,
	[price] [int] NOT NULL Constraint Price_chk CHECK (price > 0),
	[booking_date] [datetime] NOT NULL,
	[payment_mode] [varchar](50) NOT NULL,
	CONSTRAINT Ticket_PK  PRIMARY KEY (ticket_id),
	CONSTRAINT  Ticket_FK1 FOREIGN KEY (passenger_id) 
			references Passenger(passenger_id),
	CONSTRAINT  Ticket_FK2 FOREIGN KEY (route_id) 
			references [Route](route_id)
) ON [PRIMARY]
GO

---- Create table - feedback

CREATE TABLE [dbo].[Feedback](
	[reference_id] [int] NOT NULL IDENTITY(1,1),
	[ticket_id] [int] NOT NULL,
	[comment] [varchar](50) NULL,
	[rating] [int] NULL CONSTRAINT CHK_Rating CHECK (rating >= 1 AND rating <= 5),
	CONSTRAINT Feedback_PK  PRIMARY KEY (reference_id),
	CONSTRAINT  Feedback_FK2 FOREIGN KEY (ticket_id) 
			references Ticket(ticket_id)
) ON [PRIMARY]
GO

---- Create Table – Booking details

CREATE TABLE [dbo].[Booking_Details] (
	[reference_no] [int] NOT NULL IDENTITY(1,1),
	[ticket_id] [int] NOT NULL,
	[date] [datetime] NULL,
	[payment_status] [varchar](15) NULL,
	CONSTRAINT Booking_PK  PRIMARY KEY (reference_no),
	CONSTRAINT  Booking_FK FOREIGN KEY (ticket_id) 
			references Ticket(ticket_id)
) ON [PRIMARY]
GO
