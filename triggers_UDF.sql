-- user defined fuction1 ---
--- get number of times a bus has travelled in a month ----

IF OBJECT_ID (N'Bus_Travel_Per_Month', N'IF') IS NOT NULL
    DROP FUNCTION Bus_Travel_Per_Month;
go
CREATE FUNCTION Bus_Travel_Per_Month (@bus_id VARCHAR(25))
RETURNS TABLE
AS
RETURN
(
    SELECT bus_id ,YEAR(departure_time) AS Year, DATENAME(MONTH, departure_time) AS Month,COUNT(bus_id) AS Bus_Travel_Per_Month 
    FROM Schedule
    WHERE bus_id = @bus_id
    GROUP BY  bus_id,YEAR(departure_time), DATENAME(MONTH, departure_time)
    --ORDER BY YEAR(Departure_Date_Time) ASC, DATENAME(MONTH, Departure_Date_Time) ASC
);

go
SELECT * FROM Bus_Travel_Per_Month(1);
SELECT * from Bus

-- UDF 2 ----
-- To Retieve Information of Passenger Details Based on seat_number

IF OBJECT_ID (N'Passenger_Details', N'IF') IS NOT NULL
    DROP FUNCTION Passenger_Details;
go
CREATE FUNCTION Passenger_Details (@seat_number VARCHAR(25))
RETURNS TABLE
AS
RETURN
(
        SELECT t.seat_no,p.fname, p.lname, p.emailid, p.phone, p.[address] ,p.city, p.[state], p.country,
		r.route_id, tracking.bus_id
        FROM Passenger p INNER JOIN Ticket t ON p.passenger_id = t.passenger_id 
                         INNER JOIN [Route] r ON r.route_id = t.route_id
                         INNER JOIN Tracking tracking ON tracking.route_id = r.route_id
                         WHERE t.seat_no = @seat_number
);
SELECT * FROM Passenger_Details(12);
Select * FROM Ticket
GO


-- Trigger 1 -----
--- Insert detail into booking Details Table -----
go
USE FinalProject
go
CREATE TRIGGER Update_Booking_Details ON Ticket
--MAKE IDENTITY FOR PAYMENT ID

FOR INSERT
AS
BEGIN
   DECLARE @TicketId int
   DECLARE @Res_date DATE
   DECLARE @PaymentMode VARCHAR(50)
   DECLARE @PaymentStatus VARCHAR(15)
   SELECT @TicketId = ticket_id FROM inserted
   SELECT @Res_date = SYSDATETIME();
   SELECT @PaymentMode = payment_mode from Ticket where ticket_id = @TicketId

   IF @PaymentMode='Cash'
		INSERT INTO Booking_Details(ticket_id, [date], payment_status)
		VALUES (@TicketId, @Res_date, 'Incomplete');
  ELSE
		INSERT INTO Booking_Details(ticket_id, [date], payment_status)
		VALUES (@TicketId, @Res_date, 'Complete');
END


select * from Booking_Details
select * from Passenger
select* from Ticket

INSERT INTO [dbo].[Ticket] (passenger_id, route_id ,seat_no, price, booking_date, payment_mode)
VALUES (3, 5,19, 50, '2023-04-06 08:00:00', 'Credit card');