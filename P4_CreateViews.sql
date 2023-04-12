USE [FinalProject]
GO

---- view for Bus Maintenance History

CREATE VIEW BusMaintenanceHistory 
AS  
SELECT b.manufacturer, b.Seating_capacity, m.maintenence_date, m.remark  
FROM Bus b  
INNER JOIN Maintenence m  
ON b.bus_id = m.bus_id; 
 

---- view for Accident Details

CREATE VIEW AccidentDetails AS  
SELECT b.manufacturer, a.date_time, a.location, a.type_of_acc  
FROM Bus b  
INNER JOIN Accidents a  
ON b.bus_id = a.bus_id; 


---- view for Bus Accident Count

CREATE VIEW BusAccidentCount AS  
SELECT  b.bus_id,COUNT(*) AS num_accidents  
FROM Bus b  
INNER JOIN Accidents a  
ON b.bus_id = a.bus_id  
GROUP BY b.bus_id; 

---- view for Speed Above Average

CREATE VIEW SpeedAboveAverage 
AS 
SELECT manufacturer, maximum_speed , fuel_type, fuel_efficiency 
FROM Bus 
WHERE maximum_speed > (SELECT AVG(maximum_speed) FROM Bus); 

---View for Diesel_buses

CREATE VIEW Diesel_buses AS 
Select manufacturer,Seating_capacity, maximum_speed, fuel_type, fuel_efficiency  
from Bus 
where fuel_type = 'Diesel'; 

CREATE VIEW RoutebwCities AS
SELECT r.route_id, r.distance, r.bus_stop, r.hours, c1.name AS start_city_name, c2.name AS end_city_name
FROM Route r
JOIN City c1 ON r.Start_City = c1.city_id
JOIN City c2 ON r.End_city = c2.city_id;
