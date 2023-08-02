 --Question #9: 
--Calculate the total number of scheduled flights --> where, sum
--used with more than 100 empty seats in the plane. --> where
--Split the total amount of fuel by short-haul and long-haul flights. --> case when
--Exclude the flights where the manufacturer and sub-type are not available--> inner
SELECT
  CASE
    WHEN distance_flown < 2000 THEN 'short-haul'
    ELSE 'long-haul'
  END AS distance_type,
  COUNT(distinct f.flight_id) as total_number_flights
FROM
  ba_flights f
  LEFT JOIN ba_flight_routes r ON f.flight_number = r.flight_number
  INNER JOIN ba_aircraft a ON f.flight_id = a.flight_id
  LEFT JOIN ba_fuel_efficiency fuel ON a.ac_subtype = fuel.ac_subtype
WHERE
  status = 'Scheduled'
  and fuel.capacity - f.total_passengers > 100
GROUP BY
  distance_type;