--Question #4: 
--Calculate the real profit margin by product and split the data 
--using the created date before 2021-05-01 and post 2021-05-01 
--for Nike Official order items.
SELECT Distinct
  product_name,
  CASE
    WHEN o.created_at < '2021-05-01' THEN 'Pre_may'
    ELSE 'Post_may'
  END AS may_slipt,
  ROUND(((SUM(sale_price) - SUM(cost)) / SUM(sale_price))::numeric, 2) as real_margin
FROM
  order_items o
  LEFT JOIN products p ON o.product_id = p.product_id
GROUP BY
  product_name,
  may_slipt
ORDER BY
  product_name,
  may_slipt
  ;