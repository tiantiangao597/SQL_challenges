 --Question #7: 
--Create a summary of how many Nike Official order items 
--have or have no discount applied for each product. 
--Order the result per product name.
--What products are discounted more than others?
SELECT
  product_name,
  CASE
    WHEN (retail_price - sale_price) > 0 THEN 'Discount'
    ELSE 'No Discount'
  END AS discount_applied,
  Count(DISTINCT order_item_id) as num_of_items
FROM
  order_items o
  LEFT JOIN products p ON o.product_id = p.product_id
GROUP BY
  product_name,
  discount_applied
Order by
  product_name,
  discount_applied;