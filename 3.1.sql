 # Calculate the moving average of order values for each customer over their order history.
SELECT 
    ecommerce.orders.customer_id,
    ecommerce.orders.order_purchase_timestamp,
    avg(order_value) over(partition by customer_id order by order_purchase_timestamp rows between 2 preceding and current row ) as mov_avg from
( SELECT 
    ecommerce.orders.customer_id,
    ecommerce.orders.order_purchase_timestamp,
    round(SUM(ecommerce.order_items.price),2) AS order_value
FROM
    ecommerce.orders
        JOIN
    ecommerce.order_items ON ecommerce.orders.order_id = ecommerce.order_items.order_id
GROUP BY  ecommerce.orders.customer_id , ecommerce.orders.order_purchase_timestamp) as a
join 
 ecommerce.orders on 
  ecommerce.orders.customer_id = a.customer_id