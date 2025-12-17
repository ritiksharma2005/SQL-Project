# 2.Count the number of orders placed in 2017.
SELECT 
    products.product_category AS category,
    round(SUM(payments.payment_value),2) AS total_sales
FROM
    ecommerce.products
        JOIN
    ecommerce.order_items ON ecommerce.products.product_id = ecommerce.order_items.product_id
        JOIN
    ecommerce.payments ON ecommerce.payments.order_id = ecommerce.order_items.order_id
GROUP BY ecommerce.products.product_category
