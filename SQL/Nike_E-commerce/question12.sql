 --Question #12: 
--For Nike Vintage, calculate the average profit in $ generated -->avg
--per each of the vintage products.-->group
SELECT
  product_name,
  ROUND(AVG(ov.sale_price - p.cost)::numeric, 2) as avg_profit
FROM
  order_items_vintage ov
  LEFT JOIN products p 
  ON ov.product_id = p.product_id
GROUP BY
  product_name
  ;