 --Question #7: 
--create a summary of how many short-haul versus long-haul flights happen. -->CASE WHEN, COUNT
--A typical short-haul flight in Europe has a maximum distance of 2,000 km. where <
--How many flights are scheduled or completed status -->where 
--or both short-haul and long-haul flights in 2023? --> where year
SELECT
  CASE
    WHEN distance_flown < 2000 THEN 'short-haul'
    ELSE 'long-haul'
  END AS distance_type,
  COUNT(f.flight_number) as flight_times
FROM
  ba_flights f
  LEFT JOIN ba_flight_routes r ON f.flight_number = r.flight_number
WHERE
  f.actual_flight_date BETWEEN '2023-01-01' AND '2023-12-31'
  AND status in ('Scheduled', 'Completed')
GROUP BY
  distance_type;