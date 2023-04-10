CREATE NONCLUSTERED INDEX ix_Maintenance_bus_id ON Maintenence(bus_id);

CREATE NONCLUSTERED INDEX ix_Accidents_date_time ON Accidents(date_time);

CREATE NONCLUSTERED INDEX ix_Tracking_bus_id_route_id ON Tracking(bus_id, route_id);

CREATE NONCLUSTERED INDEX ix_Passenger_lname ON Passenger(lname);

CREATE INDEX idx_Ticket_PassengerId ON Ticket(passenger_id);