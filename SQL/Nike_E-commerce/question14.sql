 --Question #14: 
--How many order items of both business units (Nike Official and Nike Vintage) -->count
--have been returned or canceled, -->where
--and what is the total sales price in $ that has been impacted by it? -->sum
SELECT
  'Nike Official' as business_unit,
  COUNT(DISTINCT order_item_id) as num_items,
  ROUND(SUM(sale_price)::numeric, 2) as impacted_revenue
FROM
  order_items oi
  LEFT JOIN orders o ON oi.order_id = o.order_id
WHERE
  status in ('Returned', 'Cancelled')
UNION ALL
SELECT
  'Nike Vintage' as business_unit,
  COUNT(DISTINCT order_item_id) as num_items,
  SUM(sale_price) as impacted_revenue
FROM
  order_items_vintage ov
  LEFT JOIN orders o ON ov.order_id = o.order_id
WHERE
  status in ('Returned', 'Cancelled');