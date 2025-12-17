#4. Calculate the percentage of orders that were paid in installments.
SELECT 
    (SUM(CASE
                WHEN payments.payment_installments > 1 THEN 1
                ELSE 0
            END) * 100 / COUNT(*)) as installment_percentage
FROM
    ecommerce.payments