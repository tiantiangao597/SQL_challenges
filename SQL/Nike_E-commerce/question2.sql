--Question #2:
--What is the profit margin for each distribution center? join
--Are there any centers that stand out? --> DESC
--How do you calculate the expected profit margin for multiple products? 
--What calculation/aggregation needs to be prioritized in brackets?

SELECT
    DISTINCT name,
    ROUND(((SUM(retail_price) - SUM(cost))/SUM(retail_price))::numeric,2) as profit_margin
FROM products  p
   INNER JOIN distribution_centers d
   ON p.distribution_center_id=d.distribution_center_id
GROUP BY 
   name
ORDER BY 
   profit_margin DESC;

       









