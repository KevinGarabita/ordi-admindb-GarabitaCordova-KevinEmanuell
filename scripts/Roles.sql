USE Garabita_Cordova_KevinEmanuel;

CREATE USER IF NOT EXISTS 'admin_user'@'%' IDENTIFIED BY 'Admin123';
GRANT ALL PRIVILEGES ON apellidopaterno_apellidomaterno_nombres.* TO 'admin_user'@'%';

CREATE USER IF NOT EXISTS 'almacenista_user'@'%' IDENTIFIED BY 'Almacenista123';
GRANT SELECT, INSERT, UPDATE ON apellidopaterno_apellidomaterno_nombres.* TO 'almacenista_user'@'%';

CREATE USER IF NOT EXISTS 'aux_almacen_user'@'%' IDENTIFIED BY 'Aux123!';
GRANT SELECT ON apellidopaterno_apellidomaterno_nombres.* TO 'aux_almacen_user'@'%';

FLUSH PRIVILEGES;