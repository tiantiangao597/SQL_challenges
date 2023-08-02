 --Question #4: 
--How do the number of clients and the number of conversions compare 
--between the Display and Video for the years 2021 and 2022?
SELECT
  CASE
    WHEN ad_types LIKE '%Display%' THEN 'Display Ad'
    WHEN ad_types LIKE '%Video%' THEN 'Video Ad'
    ELSE 'Error'
  END AS ad_products,
  years,
  sum(conversions) AS total_conversions,
  count(distinct client_id) AS num_clients
FROM
  meta_revenue
WHERE
  years in ('2021', '2022')
GROUP BY
  ad_products,
  years
  ;