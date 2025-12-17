# identify the correlation between product price and the number of times a product has been purchased.
SELECT 
    ecommerce.order_items.product_id AS products,
    ecommerce.products.product_category AS category,
    COUNT(ecommerce.order_items.order_id) AS sales,
    ROUND(AVG(ecommerce.order_items.price), 2) AS price
FROM
    ecommerce.order_items
        JOIN
    ecommerce.products ON ecommerce.order_items.product_id = ecommerce.products.product_id
GROUP BY ecommerce.products.product_category , ecommerce.order_items.product_id