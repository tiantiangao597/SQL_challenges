--Question #8: 
--Assume that all Nike Official products sold would 
--have been sold at retail value and compare that against the actual sales price. 
--What is the total revenue that has been missed out on due to the discounts that have been given?
SELECT 
  ROUND(SUM(retail_price - sale_price)::numeric,2) AS total_loss
FROM order_items o
  LEFT JOIN products p
  ON o.product_id=p.product_id
Order by total_loss DESC;

