 --Question #9:
--Summarize the number of clicks that have been generated 
--for each year when the user and the advertiser have the same geographical code.
SELECT
  years,
  SUM(clicks) AS total_clicks
FROM
  meta_revenue
WHERE
  geo_user = geo_advertiser
GROUP BY
  years;