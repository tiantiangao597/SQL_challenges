 --Question #6: 
--The fuel used in liters per flight can be calculated by multiplying the fuel efficiency metric by distance, baggage weight, and number of passengers. 
--Calculate the average amount of fuel 
--used per kilometer flown of   ---> sum/sum
--completed flights per manufacturer. --> where
--What manufacturer, on average, has delivered more efficient flights? --> ASC
--If flights do not have data available about the aircraft type, you can exclude the flights from the analysis
SELECT
  a.manufacturer,
  ROUND((SUM(fuel_efficiency * distance_flown * total_passengers * baggage_weight) / sum(distance_flown))::numeric,2) as avg_fuel_usage_per_km
FROM
  ba_flights f
  INNER JOIN ba_aircraft a ON f.flight_id = a.flight_id
  INNER JOIN ba_flight_routes r ON f.flight_number = r.flight_number
  LEFT JOIN ba_fuel_efficiency fuel ON a.ac_subtype = fuel.ac_subtype
  or a.ac_subtype = fuel.manufacturer
WHERE
  status = 'Completed'
Group by
  a.manufacturer
ORDER BY
  avg_fuel_usage_per_km ASC;