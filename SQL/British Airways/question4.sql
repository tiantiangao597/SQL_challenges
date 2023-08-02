--Question #4: 
--What is the most used aircraft (manufacturer and sub-type) --> DESC
--for flights departing from London and arriving in Basel, Trondheim, or Glasgow? WHERE 
--Include the number of flights that the aircraft was used for. -->
--If the manufacturer and sub-type are not available for flights,
--we do not need to show the results of these flights.-->inner join

SELECT
  manufacturer,
  ac_subtype,
  count(f.flight_number) as used_times
FROM
  ba_flights f
  INNER JOIN ba_aircraft a ON f.flight_id = a.flight_id
  INNER JOIN ba_flight_routes r ON f.flight_number = r.flight_number
WHERE
  departure_city = 'London'
  AND arrival_city in ('Basel', 'Trondheim', 'Glasgow')
Group by
  manufacturer,
  ac_subtype
ORDER BY
  used_times DESC
LIMIT
  1;