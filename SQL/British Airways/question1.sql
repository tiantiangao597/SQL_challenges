--Question #1: 
--Create a list of flights, including the flight ID, departure city, 
--arrival_city, manufacturer, and aircraft sub-type that will be used for each flight.
--Show the results for all flights that are available 
--even if not all information is available for all flights.

SELECT
  f.flight_id,
  route.departure_city,
  route.arrival_city,
  air.manufacturer,
  air.ac_subtype
FROM
  ba_flights f
  LEFT JOIN ba_flight_routes route ON f.flight_number = route.flight_number
  LEFT JOIN ba_aircraft air ON f.flight_id = air.flight_id;