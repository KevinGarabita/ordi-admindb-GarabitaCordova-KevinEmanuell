CREATE TABLE IF NOT EXISTS warehouses (
  id INT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  city VARCHAR(100),
  address VARCHAR(255),
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  created_by VARCHAR(100),
  updated_at DATETIME NULL,
  updated_by VARCHAR(100)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS products (
  id INT PRIMARY KEY,
  sku VARCHAR(50) NOT NULL UNIQUE,
  name VARCHAR(200) NOT NULL,
  description TEXT,
  price DECIMAL(12,2) DEFAULT 0.00,
  default_warehouse_id INT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  created_by VARCHAR(100),
  updated_at DATETIME NULL,
  updated_by VARCHAR(100),
  CONSTRAINT fk_products_warehouse FOREIGN KEY (default_warehouse_id) REFERENCES warehouses(id)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS employees (
  id INT PRIMARY KEY,
  name VARCHAR(150) NOT NULL,
  role VARCHAR(100),
  email VARCHAR(150),
  phone VARCHAR(50),
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  created_by VARCHAR(100),
  updated_at DATETIME NULL,
  updated_by VARCHAR(100)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS clients (
  id INT PRIMARY KEY,
  name VARCHAR(200) NOT NULL,
  phone VARCHAR(50),
  email VARCHAR(150),
  address VARCHAR(255),
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  created_by VARCHAR(100),
  updated_at DATETIME NULL,
  updated_by VARCHAR(100)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS providers (
  id INT PRIMARY KEY,
  name VARCHAR(200) NOT NULL,
  phone VARCHAR(50),
  email VARCHAR(150),
  address VARCHAR(255),
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  created_by VARCHAR(100),
  updated_at DATETIME NULL,
  updated_by VARCHAR(100)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS orders (
  id INT PRIMARY KEY,
  client_id INT,
  order_date DATETIME,
  warehouse_id INT,
  total DECIMAL(12,2) DEFAULT 0.00,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  created_by VARCHAR(100),
  updated_at DATETIME NULL,
  updated_by VARCHAR(100),
  CONSTRAINT fk_orders_client FOREIGN KEY (client_id) REFERENCES clients(id),
  CONSTRAINT fk_orders_warehouse FOREIGN KEY (warehouse_id) REFERENCES warehouses(id)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS order_items (
  id INT PRIMARY KEY,
  order_id INT,
  product_id INT,
  quantity INT DEFAULT 1,
  price DECIMAL(12,2) DEFAULT 0.00,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  created_by VARCHAR(100),
  CONSTRAINT fk_orderitems_order FOREIGN KEY (order_id) REFERENCES orders(id),
  CONSTRAINT fk_orderitems_product FOREIGN KEY (product_id) REFERENCES products(id)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS movements (
  id INT PRIMARY KEY,
  product_id INT,
  employee_id INT,
  movement_date DATETIME,
  movement_type ENUM('IN','OUT'),
  quantity INT,
  warehouse_id INT,
  note VARCHAR(255),
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  created_by VARCHAR(100),
  CONSTRAINT fk_movements_product FOREIGN KEY (product_id) REFERENCES products(id),
  CONSTRAINT fk_movements_employee FOREIGN KEY (employee_id) REFERENCES employees(id),
  CONSTRAINT fk_movements_warehouse FOREIGN KEY (warehouse_id) REFERENCES warehouses(id)
) ENGINE=InnoDB;
