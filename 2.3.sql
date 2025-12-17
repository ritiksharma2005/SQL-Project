# Calculate the percentage of total revenue contributed by each product category.
SELECT 
    R_table.category,
    ROUND((R_table.Revenue * 100 / (SELECT 
                    SUM(ecommerce.payments.payment_value)
                FROM
                    ecommerce.payments)),
            2) AS Percent_Revenue
FROM
    (SELECT 
        ecommerce.products.product_category AS category,
            SUM(ecommerce.payments.payment_value) AS Revenue
    FROM
        ecommerce.products
    JOIN ecommerce.order_items ON ecommerce.products.product_id = ecommerce.order_items.product_id
    JOIN ecommerce.payments ON ecommerce.payments.order_id = ecommerce.order_items.order_id
    GROUP BY category) AS R_table
GROUP BY R_table.category
ORDER BY Percent_Revenue DESC