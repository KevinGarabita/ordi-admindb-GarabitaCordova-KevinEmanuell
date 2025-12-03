

DELIMITER //
DROP PROCEDURE IF EXISTS insert_products_commit;//
CREATE PROCEDURE insert_products_commit()
BEGIN
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    SELECT 'ERROR: Se hizo ROLLBACK por excepción' AS note;
  END;

  START TRANSACTION;

  INSERT INTO products (id,sku,name,description,price,default_warehouse_id,created_by) VALUES
  (11,'SKU-PR-011','Sensor Temperatura','Sensor NTC','25.00',1,'trans'),
  (12,'SKU-PR-012','Modulo Bluetooth','HC-05','80.00',1,'trans'),
  (13,'SKU-PR-013','Pantalla OLED','0.96 inch','150.00',2,'trans'),
  (14,'SKU-PR-014','Teclado USB','Teclado compacto','200.00',2,'trans'),
  (15,'SKU-PR-015','Mouse Óptico','Mouse USB','120.00',3,'trans'),
  (16,'SKU-PR-016','Cable HDMI','HDMI 2.0 1.5m','90.00',3,'trans'),
  (17,'SKU-PR-017','Fuente 12V','Fuente conmutada','350.00',4,'trans'),
  (18,'SKU-PR-018','Switch 8puertos','Switch 8x10/100','450.00',4,'trans'),
  (19,'SKU-PR-019','Conector Jack','Jack 3.5mm','5.00',5,'trans'),
  (20,'SKU-PR-020','Bateria LiPo','3.7V 2200mAh','220.00',5,'trans')
  ON DUPLICATE KEY UPDATE name=VALUES(name), price=VALUES(price);

  COMMIT;
  SELECT 'COMMIT exitoso' AS note;
END;//
DELIMITER ;

CALL insert_products_commit();
DROP PROCEDURE IF EXISTS insert_products_commit;
