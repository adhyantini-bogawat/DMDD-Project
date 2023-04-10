USE FinalProject
--procedure 1 ---
-- Checking if a bus is available for date and time ---
Go
CREATE PROCEDURE Bus_Availability_Date_Time
@Departure_Date  date,
@Arrival_Date date,
@route_id int,
@available char(1) OUTPUT

AS
IF EXISTS(SELECT bus_id FROM Schedule
	WHERE CONVERT(Date, departure_time) = @Departure_Date
    AND CONVERT(Date,arrival_time) = @Arrival_Date
	AND route_id = @route_id
)

BEGIN
    SET @available='Y'    
    SELECT * FROM Schedule
	WHERE CONVERT(Date,departure_time) = @Departure_Date
    AND CONVERT(Date,arrival_time) = @Arrival_Date
	AND route_id = @route_id
	
END
ELSE
BEGIN

Print 'No buses available for required date and cities!'
end

-- procedure 4 ---
-- Checking buses between based on start city and destination city ---
Go
CREATE PROCEDURE Bus_Availability
@route_id int,
@available char(1) OUTPUT

AS
IF EXISTS(SELECT bus_id FROM Schedule
	WHERE route_id = @route_id
)

BEGIN
    SET @available='Y'    
    SELECT * FROM Schedule
	WHERE route_id = @route_id
	
END
ELSE
BEGIN

Print 'No buses available for start and destination city!'
end

-- procedure 2 ----
-- CRUD operations on passenger information ----

Go
 CREATE PROCEDURE [dbo].[PassengerOperations] 
                    @Action VARCHAR(10), 
                    @passenger_id int = NULL, 
                    @first_name VARCHAR(100) = NULL, 
                    @last_name VARCHAR(100) = NULL, 
					@address VARCHAR(100) = NULL,
					@street VARCHAR(100) = NULL,
					@city VARCHAR(100) = NULL,  
                    @state VARCHAR(100) = NULL, 
                    @zipcode VARCHAR(100) = NULL, 
                    @country VARCHAR(100) = NULL,
					@phone_number BIGINT = NULL,
                    @email VARCHAR(100) = NULL,
					@date_of_birth DATE = NULL,
					@gender VARCHAR(10) = NULL                             

AS
BEGIN
      SET NOCOUNT ON;
 
      --SELECT
      IF @Action = 'SELECT'
      BEGIN
            SELECT * FROM Passenger
      END
 
      --INSERT
      IF @Action = 'INSERT'
      BEGIN
	INSERT INTO dbo.Passenger(fname, lname,[address],street_name ,city, [state], zipcode,
                              country, phone, emailid, dob, gender)

	VALUES (@first_name, @last_name,@address, @street,@city ,@state, @zipcode, @country, @phone_number, @email, @date_of_birth, @gender)
      END
 
      --UPDATE
      IF @Action = 'UPDATE'
      BEGIN
            UPDATE Passenger
            SET fname = @first_name, lname = @last_name, emailid= @email, phone = @phone_number, 
                address = @address, city = @city, state = @state, zipcode =  @zipcode, country = @country, dob = @date_of_birth, gender=@gender
            WHERE passenger_id = @passenger_id
      END
 
      --DELETE
      IF @Action = 'DELETE'
      BEGIN
            DELETE FROM Passenger
            WHERE passenger_id = @passenger_id
      END
END

-- procedure 3 ---
-- CRUD Operation on Bus ---
Go
 CREATE PROCEDURE [dbo].[BusOperations] 
                    @Action VARCHAR(10), 
                    @bus_id int = NULL, 
                    @manufacturer VARCHAR(100) = NULL,
					@seating_capacity int = NULL,
					@maximum_speed int = NULL,
					@fuel_type VARCHAR(50) = NULL,
					@fuel_efficiency VARCHAR(50) = NULL

AS
BEGIN
      SET NOCOUNT ON;
 
      --SELECT
      IF @Action = 'SELECT'
      BEGIN
            SELECT * FROM Bus
      END
 
      --INSERT
      IF @Action = 'INSERT'
      BEGIN
	INSERT INTO dbo.Bus( manufacturer, seating_capacity, maximum_speed, fuel_type, fuel_efficiency)

	VALUES (@manufacturer, @seating_capacity, @maximum_speed, @fuel_type, @fuel_efficiency)
      END
 
      --UPDATE
      IF @Action = 'UPDATE'
      BEGIN
            UPDATE Bus
            SET manufacturer = @manufacturer, seating_capacity = @seating_capacity,
			maximum_speed = @maximum_speed, fuel_type = @fuel_type, fuel_efficiency = @fuel_efficiency
            WHERE bus_id = @bus_id
      END
 
      --DELETE
      IF @Action = 'DELETE'
      BEGIN
            DELETE FROM Bus
            WHERE bus_id = @bus_id
      END
END
