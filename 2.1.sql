# Calculate the number of orders per month in 2018.
SELECT 
    MONTH(ecommerce.orders.order_purchase_timestamp) AS months,
    COUNT(ecommerce.orders.order_id) AS total_orders
FROM
    ecommerce.orders
WHERE
    YEAR(ecommerce.orders.order_purchase_timestamp) = 2018
GROUP BY months
ORDER BY total_orders
