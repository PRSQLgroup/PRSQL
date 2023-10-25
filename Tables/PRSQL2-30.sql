CREATE OR REPLACE VIEW count_orders_v AS
SELECT cl.first_name,cl.last_name,Count(o.order_id) AS order_count
FROM clients cl
LEFT JOIN orders o ON cl.client_id = o.client_id
GROUP BY cl.first_name, cl.last_name
ORDER BY order_count DESC;
