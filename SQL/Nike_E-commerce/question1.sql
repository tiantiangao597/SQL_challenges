--Question #1: 
--If we exclude the discounts that have been given,the expected profit margin for each product is calculated by: (retail price - cost) / retail price. 
--Create a column that flags products with a name that includes “Vintage” as products from Nike Vintage and Nike Official otherwise. 
--Calculate the expected profit margins for each product name and include the group that splits products between Nike Official and Nike Vintage in the result.

SELECT 
    CASE 
    WHEN product_name LIKE '%Vintage%' THEN 'Nike Vintage'
    ELSE 'Nike Offical'
    END AS business_unit,
    product_name,
    ROUND(((retail_price - cost)/retail_price)::numeric,2) as profit_margin
FROM products;
    









