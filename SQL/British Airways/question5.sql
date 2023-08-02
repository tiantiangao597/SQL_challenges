
--Question #5: 
--For the flight routes highlighted in question 4 combined, 
--would there have been an aircraft that, on average, would use less fuel on the flight routes? -->avg()
--The fuel used in liters per flight can be calculated by
--multiplying the fuel efficiency metric by distance, baggage weight, and number of passengers. 
--What aircraft (manufacturer and sub-type) would you recommend to use 
--for each of these flight routes if you use the average fuel consumption as your guiding metric?
--If the manufacturer and sub-type are not available for flights, we do not need to show the results of these flights.-->INNER

SELECT 
       a.manufacturer,
       a.ac_subtype,
       ROUND(AVG(fuel_efficiency * distance_flown * total_passengers * baggage_weight)::numeric,2) as avg_fuel_used
FROM ba_flights f 
  INNER JOIN ba_aircraft a 
  ON f.flight_id=a.flight_id
  INNER JOIN ba_flight_routes r
  ON f.flight_number=r.flight_number
  LEFT JOIN ba_fuel_efficiency fuel
  ON a.ac_subtype=fuel.ac_subtype or a.ac_subtype=fuel.manufacturer  
WHERE departure_city='London' 
      AND arrival_city in ('Basel','Trondheim','Glasgow')
Group by 
       a.manufacturer,
       a.ac_subtype
ORDER BY avg_fuel_used ASC
;





