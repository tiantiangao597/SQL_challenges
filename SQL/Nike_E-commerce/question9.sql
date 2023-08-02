 --Question #9: 
--What is the number of order items by each business unit (Nike Official and Nike Vintage)?
WITH
  nike_offical as (
    SELECT
      COUNT(Distinct order_item_id) as num_of_nike_offical
    FROM
      order_items
  ),
  nike_vintage as (
    SELECT
      COUNT(Distinct order_item_id) as num_of_nike_vintage
    FROM
      order_items_vintage
  )
SELECT
  *
FROM
  nike_offical,
  nike_vintage
  ;