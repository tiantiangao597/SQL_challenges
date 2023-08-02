 --Question 3:
--What aircraft (manufacturer and sub-type) 
--have completed flights of 
--a distance of 7,000 km or more? 

SELECT distinct
  manufacturer,
  ac_subtype
FROM
  ba_aircraft a
  LEFT JOIN ba_flights f ON a.flight_id = f.flight_id
  LEFT JOIN ba_flight_routes r ON f.flight_number = r.flight_number
WHERE
  status = 'Completed'
  and distance_flown >= 7000;