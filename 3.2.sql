# Calculate the cumulative sales per month for each year.
select month(order_date) as months, year(order_date) as years,
sum(order_value) over(partition by year (order_date) order by month(order_date) ) as cumulative_sales from
(select date_format(ecommerce.orders.order_purchase_timestamp,'%y-%m-01') as order_date,
(ecommerce.payments.payment_value) as order_value from ecommerce.orders join
ecommerce.payments on ecommerce.orders.order_id= ecommerce.payments.order_id
) as cumulative_table
order by months,years 