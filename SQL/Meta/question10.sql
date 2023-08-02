 --Question #10: 
---Create a new column that splits the data between domestic activity and international activity.
--Domestic activity means that the user and advertiser have the same geography code. 
--International activity means that the user and advertiser have a different geography codes.
--How much revenue has been generated through domestic activity 
--versus international activity in 2022 for each platform (Instagram and Facebook)?
SELECT
  parent_company,
  geo_group,
  ROUND(SUM(revenue)::numeric,2) as total_revenue
FROM
  (
    SELECT
      *,
      CASE
        WHEN geo_user = geo_advertiser THEN 'Domestic'
        ELSE 'International'
      END AS geo_group
    FROM
      meta_revenue
  ) AS new_table
WHERE
  years = 2022
GROUP BY
  geo_group,
  parent_company
  ;