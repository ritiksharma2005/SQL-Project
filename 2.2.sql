#  Find the average number of products per order, grouped by customer city.
select ecommerce.customers.customer_city as city, avg(new_table.c) as average_order from ecommerce.customers
join 
( select ecommerce.orders.order_id,ecommerce.orders.customer_id, count(ecommerce.order_items.order_id) as c
from ecommerce.orders join ecommerce.order_items on
ecommerce.orders.order_id=ecommerce.order_items.order_id
group by ecommerce.orders.order_id,ecommerce.orders.customer_id) as new_table
on
ecommerce.customers.customer_id=new_table.customer_id
group by city
order by average_order