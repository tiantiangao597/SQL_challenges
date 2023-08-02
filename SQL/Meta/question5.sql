 --Question #5: 
--What is the number of impressions in 2022
--per age group across Facebook and Instagram?
SELECT
  age_bucket_user,
  parent_company,
  SUM(impressions) AS toal_impressions
FROM
  meta_revenue
WHERE
  years = 2022
GROUP BY
  age_bucket_user,
  parent_company
ORDER BY
  age_bucket_user
  ;