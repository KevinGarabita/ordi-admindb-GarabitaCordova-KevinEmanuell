USE Garabita_Cordova_KevinEmanuel;

SELECT
  p.name AS product_name,
  c.name AS client_name,
  o.order_date AS sale_date,
  oi.quantity AS pieces_sold,
  (oi.quantity * oi.price) AS total_sold,
  w.name AS warehouse_name
FROM orders o
JOIN order_items oi ON o.id = oi.order_id
JOIN products p ON oi.product_id = p.id
LEFT JOIN clients c ON o.client_id = c.id
LEFT JOIN warehouses w ON o.warehouse_id = w.id
WHERE o.order_date >= '2025-11-05 00:00:00' AND o.order_date <= '2025-11-30 23:59:59'
ORDER BY o.order_date, p.name;
