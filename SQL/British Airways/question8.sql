 --Question #8: 
--We can calculate how full flights were by comparing the number of passengers
--on the flight against the capacity of the aircraft. --> empty=capacity-total_passengers
--Calculate the average number of empty seats --> avg
--for the short-haul and long-haul flights. --> group by
--Additionally, can you also calculate the average number of empty seats 
--as a percentage of the maximum number of passengers?  --> percentage
--If the manufacturer and sub-type are not available for flights,
--we do not need to show the results of these flights.  ---> inner
SELECT
  CASE
    WHEN distance_flown < 2000 THEN 'short-haul'
    ELSE 'long-haul'
  END AS distance_type,
  ROUND(AVG(fuel.capacity - f.total_passengers)::numeric, 2) AS avg_empty_seats,
  ROUND(AVG((fuel.capacity - f.total_passengers) / fuel.capacity)::numeric,2) AS avg_empty_seats_pct
FROM
  ba_flights f
  LEFT JOIN ba_flight_routes r ON f.flight_number = r.flight_number
  INNER JOIN ba_aircraft a ON f.flight_id = a.flight_id
  INNER JOIN ba_fuel_efficiency fuel ON a.ac_subtype = fuel.ac_subtype
GROUP BY
  distance_type;