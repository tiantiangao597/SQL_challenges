--Question #7: 
--A standard metric to analyze in the ads business is called conversion-per-click
--which is defined as your total conversion value divided by the number of clicks.
--Can you build the conversion-per-click metric 
--and analyze how the metric is trending 
--for Instagram for the age bucket 18-24 over the last few years?

SELECT 
    years,
    ROUND((sum(conversions)/sum(clicks))::numeric*100,2) AS conversion_per_click
FROM meta_revenue
WHERE 
    parent_company='Instagram' 
    AND age_bucket_user='18-24'
GROUP BY years
ORDER BY years;










