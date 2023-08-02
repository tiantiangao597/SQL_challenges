 --Question #11: 
--What are the short-haul flight routes and the average number of seats 
--for short-haul flight routes that only have been completed 2 or fewer times? 
--Include the flight number, departure city, arrival city, and average empty seats in your results.
--Make sure to include all flights that are available in the data even if the capacity information for some flights might be missing.

SELECT
  route.flight_number,
  route.departure_city,
  route.arrival_city,
  avg(fuel.capacity - f.total_passengers) as avg_empty_seats
FROM
  ba_flights f
  LEFT JOIN ba_flight_routes route ON route.flight_number = f.flight_number
  LEFT JOIN ba_aircraft a ON a.flight_id = f.flight_id
  LEFT JOIN ba_fuel_efficiency fuel ON fuel.ac_subtype = a.ac_subtype
WHERE
  status = 'Completed'
  AND distance_flown <= 2000
GROUP BY
  route.flight_number,
  route.departure_city,
  route.arrival_city
HAVING
  COUNT(DISTINCT f.flight_id) <= 2
  ;