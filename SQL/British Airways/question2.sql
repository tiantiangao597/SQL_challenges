 --Question #2: 
--What is the maximum number of passengers 
--that have been on every available aircraft (manufacturer and sub-type)
--for flights that have been completed?
--If the manufacturer and sub-type are not available for flights, 
--we do not need to show the results of these flights.


SELECT
  air.manufacturer,
  air.ac_subtype,
  MAX(f.total_passengers) AS max_passengers
FROM
  ba_flights f
  INNER JOIN ba_aircraft air ON f.flight_id = air.flight_id
WHERE
  f.status = 'Completed'
GROUP BY
  air.manufacturer,
  air.ac_subtype