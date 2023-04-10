USE FinalProject
go
--test case
select * from Schedule
declare @display_available char(1)
EXEC Bus_Availability_Date_Time '2023-03-26','2023-03-26', 1, @available=@display_available OUTPUT
PRINT cast(@display_available as varchar)+ ' There are buses which are available for booking on these dates and for the route specified'

go
--test case
declare @display_available char(1)
EXEC Bus_Availability  1, @available=@display_available OUTPUT
PRINT cast(@display_available as varchar)+ ' There are buses which are available for booking for the route specified'

--test cases
go

    EXEC [FinalProject].[dbo].[PassengerOperations] @Action = 'SELECT'

    EXEC [FinalProject].[dbo].[PassengerOperations] @Action = 'INSERT' ,
    @first_name = 'Adhyantini', 
    @last_name = 'Bogawat',
    @email = 'ab@gmail.com',
	@date_of_birth = '1998-07-26',
	@gender = 'Female',
    @phone_number = 8976432268, 
    @address = 'Balmoral Estate', 
	@street = 'Baner',
    @city = 'Pune',
    @state = 'MH', 
    @zipcode = 41104, 
    @country = 'India'

  EXEC  [FinalProject].[dbo].[PassengerOperations] @Action = 'UPDATE',
    @passenger_id = 12 ,
    @first_name = 'Shweta', 
    @last_name = 'Garg',
    @email = 'adhyantini@gmail.com',
	@date_of_birth = '1998-07-26',
	@gender = 'Female',
    @phone_number = 8976432265, 
    @address = 'Boylston Street', 
    @city = 'Boston',
    @state = 'MA', 
    @zipcode = 42215,
    @country = 'USA'        
                  
EXEC [FinalProject].[dbo].[PassengerOperations] @Action= 'DELETE',
                  @Passenger_ID = 14


--test cases
go

    EXEC [FinalProject].[dbo].[BusOperations] @Action = 'SELECT'

    EXEC [FinalProject].[dbo].[BusOperations] @Action = 'INSERT' ,
    @manufacturer = 'Adhyantini', 
    @seating_capacity = 50,
	@maximum_speed = 150,
	@fuel_type = 'Diesel',
	@fuel_efficiency = '15 km/l'

  EXEC  [FinalProject].[dbo].[BusOperations] @Action = 'UPDATE',
    @bus_id = 11 ,
    @manufacturer = 'Ashok Leyland', 
    @seating_capacity = 60,
	@maximum_speed = 150,
	@fuel_type = 'Diesel',
	@fuel_efficiency = '15 km/l'       
                  
EXEC [FinalProject].[dbo].[BusOperations] @Action= 'DELETE',
                  @bus_id = 11