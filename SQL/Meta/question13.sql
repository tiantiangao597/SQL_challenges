 --Question #13: 
--What is the average amount of revenue per ad that is generated 
--per quarter for the SMB sales team in 2022?
SELECT
  quarters,
  ROUND((SUM(revenue) / COUNT(distinct ad_id))::numeric,2) AS avg_revenue_per_ad
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
  ) as new_table
WHERE
  years = 2022
  AND sales_team LIKE '%SMB%'
GROUP BY
  quarters
ORDER BY
  quarters
  ;