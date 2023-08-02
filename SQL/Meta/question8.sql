 --Question #8: 
--Video ads have been booming in the last few years. 
--TikTok is apparently popular amongst the youngsters. 
--Identify the ad_id of Video ads that have generated over 2 million in revenue in 2022?
--Note: the revenue numbers are already in millions, so 2 million will be 2
SELECT
  ad_id,
  ROUND(SUM(revenue)::numeric,2) AS total_revenue
FROM
  meta_revenue
WHERE
  ad_types LIKE '%Video%'
  AND years = 2022
GROUP BY
  ad_id
HAVING
  SUM(revenue) > 2
  ;