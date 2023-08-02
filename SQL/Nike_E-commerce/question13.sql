 --Question #13: 
--What product name generated the highest cumulative profit in $ 
--for Nike Vintage in the calendar year 2022 (based on the order created date)? 
SELECT
  product_name,
  ROUND(SUM(ov.sale_price - p.cost)::numeric, 2) as total_profit
FROM
  order_items_vintage ov
  LEFT JOIN products p ON ov.product_id = p.product_id
WHERE
  created_at BETWEEN '2022-01-01' AND '2022-12-31'
GROUP BY
  product_name
ORDER BY
  total_profit DESC
LIMIT
  1;