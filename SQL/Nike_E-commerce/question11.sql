 --Question #11: 
--For order items sold with a discount, 
--what is the average discount given in $ for each product
--and for each business unit (Nike Official and Nike Vintage)?
SELECT
  'Nike Offical' AS business_unit,
  product_name,
  ROUND(AVG(retail_price - sale_price)::numeric, 2) as avg_discount
FROM
  order_items o
  LEFT JOIN products p on o.product_id = p.product_id
WHERE
  retail_price - sale_price > 0
GROUP BY
  product_name
UNION ALL
SELECT
  'Nike Vintage' AS business_unit,
  product_name,
  ROUND(AVG(retail_price - sale_price)::numeric,2) as avg_discount
From
  order_items_vintage ov
  LEFT JOIN products p on ov.product_id = p.product_id
WHERE
  retail_price - sale_price > 0
GROUP BY
  product_name
  ;