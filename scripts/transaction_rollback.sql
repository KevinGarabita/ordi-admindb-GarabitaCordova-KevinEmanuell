USE apellidopaterno_apel;

DELIMITER //
DROP PROCEDURE IF EXISTS insert_products_rollback;//
CREATE PROCEDURE insert_products_rollback()
BEGIN
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    SELECT 'ROLLBACK ejecutado por error' AS note;
  END;

  START TRANSACTION;

  INSERT INTO products (id,sku,name,description,price,default_warehouse_id,created_by) VALUES
  (21,'SKU-PR-021','Cable Serial','Cable DB9','60.00',1,'trans'),
  (22,'SKU-PR-022','Antena WiFi','Antena RP-SMA','120.00',1,'trans'),
  (23,'SKU-PR-023','Modulo WiFi','ESP8266','90.00',2,'trans'),
  (24,'SKU-PR-024','Sensor Humedad','DHT22','70.00',2,'trans'),
  (25,'SKU-PR-025','Relé 1 canal','Relé 5V','30.00',3,'trans'),
  (26,'SKU-PR-026','Modulo NFC','MFRC522','140.00',3,'trans'),
  (27,'SKU-PR-027','Led RGB','Tira LED','45.00',4,'trans'),
  (28,'SKU-PR-028','Protoboard','MB-102','80.00',4,'trans'),
  -- Siguiente línea repetirá un SKU ya insertado arriba (intencional)
  (29,'SKU-PR-012','Duplicado intencional','Este SKU ya existe y provocará error',999.00,5,'trans'),
  (30,'SKU-PR-030','Micro SD 16GB','Tarjeta microSD','55.00',5,'trans')
  ON DUPLICATE KEY UPDATE name=VALUES(name);

  -- Si alguna de las inserciones falla, el handler realizará ROLLBACK
  COMMIT;
  SELECT 'COMMIT (no esperado) - si llegaste aquí no hubo error' AS note;
END;//
DELIMITER ;

CALL insert_products_rollback();
DROP PROCEDURE IF EXISTS insert_products_rollback;