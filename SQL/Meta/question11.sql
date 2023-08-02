 --Question #11: 
--Analyse if there is a clear distinction in the sales of the LCS (Large Customer Sales) 
--and SMB (Small and Medium Businesses) sales teams.
--Anything that doesn’t match LCS or SMB can be called Other.
--How much revenue did the LCS and SMB sales teams generate in 2022 
--split between domestic and international activity?
SELECT
  sales_team_size,
  geo_group,
  ROUND(SUM(revenue)::numeric,2) as total_revenue
FROM
  (
    SELECT
      *,
      CASE
        WHEN geo_user = geo_advertiser THEN 'Domestic'
        ELSE 'International'
      END AS geo_group,
      CASE
        WHEN sales_team LIKE '%LCS%' THEN 'LCS'
        WHEN sales_team LIKE '%SMB%' THEN 'SMB'
        ELSE 'Other'
      END AS sales_team_size
    FROM
      meta_revenue
  ) AS new_table
WHERE
  years = 2022
GROUP BY
  geo_group,
  sales_team_size
ORDER by
  sales_team_size
  ;