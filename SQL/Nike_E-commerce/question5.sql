 --Question #5: 
--Calculate the profit margin 
--by product  --group by
--for both Nike Official and Nike Vintage products 
--in a single view.
SELECT
  product_name,
  ROUND(((SUM(sale_price) - SUM(cost)) / SUM(sale_price))::numeric, 2) as margin
FROM
  order_items o
  LEFT JOIN products p ON o.product_id = p.product_id
GROUP BY
  product_name
UNION ALL
SELECT
  product_name,
  (SUM(sale_price) - SUM(cost)) / SUM(sale_price) as margin
FROM
  order_items_vintage ov
  LEFT JOIN products p ON ov.product_id = p.product_id
GROUP BY
  product_name
  ;