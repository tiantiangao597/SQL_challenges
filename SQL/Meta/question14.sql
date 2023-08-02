--Question #14: 
--Calculate the following metrics for the top 10 clients 
--that have the highest amount of revenue in 2022: 
--Total revenue, total conversions, total clicks, conversions per click,
--and average revenue per conversion

SELECT 
    distinct client_id,
    ROUND(SUM(revenue)::numeric,2) as total_revenue,
    SUM(conversions) as total_conversions,
    SUM(clicks) as total_clicks,
    ROUND((SUM(conversions)/SUM(clicks))::numeric,4) as conversions_per_click,
    ROUND((SUM(revenue)/sum(conversions))::numeric,4) as avg_revenue_per_click   
FROM meta_revenue
WHERE years = 2022
GROUP BY 
   client_id
ORDER BY 
   total_revenue DESC
LIMIT 
   10;