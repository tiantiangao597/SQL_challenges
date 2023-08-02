--Question #10: 
--What is the number of order items sold with a discount
--(sales price being smaller than retail price) 
--by each business unit (Nike Official and Nike Vintage)?
--What is the total revenue generated from these items?
SELECT
  'Nike Offical' AS business_unit,
  Count(Distinct order_item_id) as num_orders,
  SUM(sale_price) as total_revenue
From
  order_items o
  Left join products p on o.product_id = p.product_id
WHERE
  retail_price - sale_price > 0
UNION ALL
SELECT
  'Nike Vintage' AS business_unit,
  Count(Distinct order_item_id) as num_orders,
  SUM(sale_price) as total_revenue
From
  order_items_vintage ov
  Left join products p on ov.product_id = p.product_id
WHERE
  retail_price - sale_price > 0
  ;