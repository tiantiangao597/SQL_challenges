 --Question #12: 
--Create a column that summarizes the dates based on the calendar quarters in the year 
--(e.g., Q1 is 2022-01-01 to 2022-03-31). 
--What is the revenue and number of conversions 
--generated per quarter for the SMB sales team in 2022?
SELECT
  quarters,
  ROUND(SUM(revenue)::numeric,2) as total_revenue,
  SUM(conversions) AS total_conversions
FROM
  (
    SELECT
      *,
      CASE
        WHEN dates BETWEEN '2022-01-01' AND '2022-03-31'  THEN 'Q1'
        WHEN dates BETWEEN '2022-04-01' AND '2022-06-30'  THEN 'Q2'
        WHEN dates BETWEEN '2022-07-01' AND '2022-09-30'  THEN 'Q3'
        ELSE 'Q4'
      END AS quarters
    FROM
      meta_revenue
  ) AS new_table
WHERE
  years = 2022
  AND sales_team LIKE '%SMB%'
GROUP BY
  quarters
ORDER BY
  quarters
  ;