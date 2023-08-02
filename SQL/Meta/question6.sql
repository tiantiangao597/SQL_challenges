--Question #6: 
--Have the number of conversions been trending upwards or downwards 
--for Facebook 
--for the age bucket 18-24 and 25-34 
--over the last few years?
SELECT
  years,
  sum(conversions) AS total_conversions
FROM
  meta_revenue
WHERE
  parent_company = 'Facebook'
  AND age_bucket_user in ('18-24', '25-34')
GROUP BY
  years
ORDER BY
  years
  ;