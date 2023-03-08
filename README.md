# Travel Company Management System

In this project, we are going to design a database for a travel company, To
provide a centralized database for storing, managing and analyzing transportation data, including 
information on vehicles, routes, managing driver information and passenger information. We have also provided data on accidents occured by a particular driver and the vehcile. The data would help company provide a better customer service and more efficient and safe travel.

## Entities

1. Bus - This entity mainly provides information about each bus such as the model, make, license plate number and seating capacity.

2. Maintainance - Information about maintainance performed on each bus including date, description and cost.

3. Schedule - Information about the departure and arrival times for each bus on each route.

4. Accident: Information about any accidents involving the buses, including the date, location, cause, and damage.

5. Driver: Information about each driver, such as their name, contact information, and driving record.

6. Route: Information about each route, such as the start and end points, stops along the way, and estimated travel time.

7. Booking Details: Information about the customer_id and the route_id and the ticket_id. It acts as an associative entity between the three    entities.

8. Passenger:  Information about each passenger, such as their name, contact information, and travel history.

9. City: Information about each city covered by the travel company such as city name and state it belongs to.

10. Ticket: Information about each ticket sold, such as the route, date, time, seat number, and fare.

11. Feedback:  Information about customer feedback, including ratings and comments about the buses, routes, and drivers.

12. Tracking: Information about the bus such as the bus ID, the route the bus is following, any alerts/notifications regarding the bus and next stop.

##  Updates made
1. The bus stop entity was removed and added as an attribute in the route entity.
2. Relationship between driver and route was established.
3. Relationship between ticket and passenger was established. 
4. More realistic attributes were added to every entity.
