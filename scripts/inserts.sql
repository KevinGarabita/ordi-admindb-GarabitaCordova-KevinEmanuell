
INSERT INTO warehouses (id,name,city,address,created_by) VALUES
(1,'Almacen Mérida','Mérida','Calle 1, Col Centro','seed'),
(2,'Almacen Cancún','Cancún','Av Playa, Lote 5','seed'),
(3,'Almacen Valladolid','Valladolid','Calle 3, Zona Industrial','seed'),
(4,'Almacen Tulum','Tulum','Carretera 101','seed'),
(5,'Almacen Progreso','Progreso','Muelle 7','seed')
ON DUPLICATE KEY UPDATE name=VALUES(name);

INSERT INTO products (id,sku,name,description,price,default_warehouse_id,created_by) VALUES
(1,'SKU-CABLE-C-001','Cable USB C','Cable tipo C 1m','120.00',1,'seed'),
(2,'SKU-CABLE-C-002','Cable Tipo C','Cable tipo C 2m','150.00',1,'seed'),
(3,'SKU-RES-10K-001','Resistencia 10K','Resistencia 1/4W 10K','0.50',2,'seed'),
(4,'SKU-CAP-10UF-001','Capacitor 10uF','Electrolítico 10uF 16V','1.20',2,'seed'),
(5,'SKU-IC-555-001','Timer 555','CI NE555','10.00',3,'seed')
ON DUPLICATE KEY UPDATE name=VALUES(name), price=VALUES(price);

INSERT INTO employees (id,name,role,email,phone,created_by) VALUES
(1,'Juan Pérez','Almacenista','juan.perez@example.com','9991001001','seed'),
(2,'María López','Aux Almacén','maria.lopez@example.com','9991001002','seed'),
(3,'Pedro Gómez','Admin','pedro.gomez@example.com','9991001003','seed'),
(4,'Laura Ruiz','Almacenista','laura.ruiz@example.com','9991001004','seed'),
(5,'Diego Torres','Aux Almacén','diego.torres@example.com','9991001005','seed')
ON DUPLICATE KEY UPDATE name=VALUES(name);

INSERT INTO clients (id,name,phone,email,address,created_by) VALUES
(1,'Electronica Yucatan','9992003001','contacto@electronica.com','Calle 10','seed'),
(2,'CompuCentro','9992003002','ventas@compucentro.com','Av Central 5','seed'),
(3,'Repuestos S.A.','9992003003','info@repuestos.com','Calle 7','seed'),
(4,'Tienda Electronica','9992003004','ventas@tienda.com','Av Norte','seed'),
(5,'Servicios Tech','9992003005','contacto@servicios.com','Paseo 1','seed')
ON DUPLICATE KEY UPDATE name=VALUES(name);

INSERT INTO providers (id,name,phone,email,address,created_by) VALUES
(1,'Proveedor A','9993004001','provA@example.com','Polígono 1','seed'),
(2,'Proveedor B','9993004002','provB@example.com','Polígono 2','seed'),
(3,'Proveedor C','9993004003','provC@example.com','Polígono 3','seed'),
(4,'Proveedor D','9993004004','provD@example.com','Polígono 4','seed'),
(5,'Proveedor E','9993004005','provE@example.com','Polígono 5','seed')
ON DUPLICATE KEY UPDATE name=VALUES(name);

INSERT INTO orders (id,client_id,order_date,warehouse_id,total,created_by) VALUES
(1001,1,'2025-11-05 10:15:00',1,240.00,'seed'),
(1002,2,'2025-11-10 14:00:00',2,300.00,'seed'),
(1003,3,'2025-11-20 09:30:00',1,50.00,'seed'),
(1004,1,'2025-12-01 11:00:00',3,120.00,'seed'),
(1005,4,'2025-11-25 18:20:00',2,180.00,'seed')
ON DUPLICATE KEY UPDATE total=VALUES(total);

INSERT INTO order_items (id,order_id,product_id,quantity,price,created_by) VALUES
(2001,1001,1,2,120.00,'seed'),
(2002,1002,3,100,0.50,'seed'),
(2003,1003,5,5,10.00,'seed'),
(2004,1004,2,1,150.00,'seed'),
(2005,1005,4,150,1.20,'seed')
ON DUPLICATE KEY UPDATE quantity=VALUES(quantity);

INSERT INTO movements (id,product_id,employee_id,movement_date,movement_type,quantity,warehouse_id,note,created_by) VALUES
(3001,1,1,'2025-10-31 09:00:00','IN',100,1,'Ingreso inicial','seed'),
(3002,1,1,'2025-11-06 12:00:00','OUT',2,1,'Venta','seed'),
(3003,3,2,'2025-11-10 15:00:00','OUT',100,2,'Pedido','seed'),
(3004,4,1,'2025-11-25 19:00:00','OUT',150,2,'Pedido','seed'),
(3005,5,3,'2025-11-20 10:00:00','IN',50,1,'Entrada proveedor','seed')
ON DUPLICATE KEY UPDATE quantity=VALUES(quantity);
