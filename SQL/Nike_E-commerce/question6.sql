 --Question #6: 
--What are the top 10 products 
--by profit margin from Nike Official and Nike Vintage?
--Include the product name, profit margin, and what business unit (Nike Official or Nike Vintage) sells the product.
SELECT
  product_name,
  ROUND(((SUM(sale_price) - SUM(cost)) / SUM(sale_price))::numeric, 2) as margin,
  'Nike Offical' as business_unit
FROM
  order_items o
  LEFT JOIN products p ON o.product_id = p.product_id
GROUP BY
  product_name
UNION ALL
SELECT
  product_name,
  ROUND(((SUM(sale_price) - SUM(cost)) / SUM(sale_price))::numeric, 2) as margin,
  'Nike Vintage' as business_unit
FROM
  order_items_vintage ov
  LEFT JOIN products p ON ov.product_id = p.product_id
GROUP BY
  product_name
ORDER BY
  margin DESC
LIMIT
  10
  ;