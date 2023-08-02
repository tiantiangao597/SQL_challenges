 --Question #10: 
--What short-haul flight routes 
--that have been completed have   --> where status
--the highest average number of empty seats? 
--Include the flight number, departure city, arrival city,
--number of completed flights, and average empty seats in your results.
--Make sure to include all flights that are available in the data 
--even if the capacity information for some flights might be missing.
SELECT
  route.flight_number,
  route.departure_city,
  route.arrival_city,
  COUNT(distinct f.flight_id) as total_flights,
  avg(fuel.capacity - f.total_passengers) as avg_empty_seats
FROM
  ba_flights f
  LEFT JOIN ba_flight_routes route ON f.flight_number = route.flight_number
  LEFT JOIN ba_aircraft a ON f.flight_id = a.flight_id
  LEFT JOIN ba_fuel_efficiency fuel ON a.ac_subtype = fuel.ac_subtype
WHERE
  status = 'Completed'
  AND distance_flown <= 2000
GROUP BY
  route.flight_number,
  route.departure_city,
  route.arrival_city
Order by
  avg_empty_seats DESC
  ;