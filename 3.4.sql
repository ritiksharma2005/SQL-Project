# Calculate the retention rate of customers, defined as the percentage of customers 
# who make another purchase within 6 months of their first purchase 
SELECT
    ROUND(
        COUNT(DISTINCT retained.customer_id) * 100.0 /
        (SELECT COUNT(DISTINCT customer_id) FROM ecommerce.orders),
        2
    ) AS retention_rate_percentage
FROM (
    SELECT DISTINCT
        first_orders.customer_id
    FROM (
        SELECT
            ecommerce.orders.customer_id,
            MIN(ecommerce.orders.order_purchase_timestamp) AS first_purchase_date
        FROM ecommerce.orders
        GROUP BY ecommerce.orders.customer_id
    ) first_orders
    JOIN ecommerce.orders
        ON ecommerce.orders.customer_id = first_orders.customer_id
    WHERE ecommerce.orders.order_purchase_timestamp > first_orders.first_purchase_date
      AND ecommerce.orders.order_purchase_timestamp <= 
          DATE_ADD(first_orders.first_purchase_date, INTERVAL 6 MONTH)
) retained;
