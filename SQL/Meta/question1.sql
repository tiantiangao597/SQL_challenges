--Question #1: 
--How has the revenue of Instagram changed over the years?
--Provide an overview of the revenue per year.

SELECT years, 
       ROUND(SUM(revenue)::numeric,2) AS total_revenue
FROM meta_revenue
WHERE parent_company='Instagram'
GROUP BY
     years, 
     parent_company;









