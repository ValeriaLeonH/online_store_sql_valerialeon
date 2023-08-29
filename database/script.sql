CREATE DATABASE online_store;

USE online_store;

CREATE TABLE clients(
  id int(11) NOT NULL AUTO_INCREMENT,
  document_type_id INT(11) DEFAULT NULL,
  id_number INT(11) DEFAULT NULL,
  name VARCHAR(30) DEFAULT NULL,
  cell_phone_number VARCHAR(30) DEFAULT NULL,
  email VARCHAR(30) DEFAULT NULL,
  address VARCHAR(30) DEFAULT NULL,
  PRIMARY KEY (id),
  KEY document_type_id (document_type_id),
  CONSTRAINT clients_ibfk_1 FOREIGN KEY (document_type_id) REFERENCES document_types(id)
);

CREATE TABLE client_address (
  id INT(11) NOT NULL AUTO_INCREMENT,
  address VARCHAR(30) DEFAULT NULL,
  client_id INT(11) DEFAULT NULL,
  PRIMARY KEY (id),
  KEY client_id (client_id),
  CONSTRAINT client_address_ibfk_1 FOREIGN KEY (client_id) REFERENCES clients(id);
);

CREATE TABLE document_types (
  id INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE dollar_prices (
  id INT(11) NOT NULL AUTO_INCREMENT,
  price FLOAT DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE employees (
  id INT(11) NOT NULL AUTO_INCREMENT,
  employee_type_id INT(11) DEFAULT NULL,
  document_type_id INT(11) DEFAULT NULL,
  id_number INT(11) DEFAULT NULL,
  name VARCHAR(30) DEFAULT NULL,
  cell_phone_number VARCHAR(30) DEFAULT NULL,
  email VARCHAR(30) DEFAULT NULL,
  is_employed TINYINT(1) DEFAULT NULL,
  PRIMARY KEY (id),
  KEY employee_type_id (employee_type_id),
  KEY document_type_id (document_type_id),
  CONSTRAINT employees_ibfk_1 FOREIGN KEY (employee_type_id) REFERENCES employee_types(id),
  CONSTRAINT employees_ibfk_2 FOREIGN KEY (document_type_id) REFERENCES document_types(id)
);

CREATE TABLE employee_types (
  id INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(30) DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE meeting_media (
  id INT(11) NOT NULL AUTO_INCREMENT,
  client_id INT(11) DEFAULT NULL,
  banners TINYINT(1) DEFAULT NULL,
  web TINYINT(1) DEFAULT NULL,
  social_media TINYINT(1) DEFAULT NULL,
  frills TINYINT(1) DEFAULT NULL,
  newspaper TINYINT(1) DEFAULT NULL,
  magazines TINYINT(1) DEFAULT NULL,
  internet TINYINT(1) DEFAULT NULL,
  for_a_friend TINYINT(1) DEFAULT NULL,
  PRIMARY KEY (id),
  KEY client_id (client_id),
  CONSTRAINT meeting_media_ibfk_1 FOREIGN KEY (client_id) REFERENCES clients (id)
);

CREATE TABLE products(
  id INT(11) NOT NULL,
  dollar_prices_id INT(11) DEFAULT NULL,
  code VARCHAR(30) DEFAULT NULL,
  product VARCHAR(30) DEFAULT NULL,
  stock INT(11) DEFAULT NULL,
  description VARCHAR(100) DEFAULT NULL,
  PRIMARY KEY (id),
  KEY dollar_prices_id (dollar_prices_id),
  CONSTRAINT products_ibfk_1 FOREIGN KEY (dollar_prices_id) REFERENCES dollar_prices (id)
);

CREATE TABLE reviews(
  id INT(11) NOT NULL,
  client_id INT(11) DEFAULT NULL,
  product_id INT(11) DEFAULT NULL,
  review VARCHAR(100) DEFAULT NULL,
  PRIMARY KEY (id),
  KEY client_id (client_id),
  KEY product_id (product_id),
  CONSTRAINT reviews_ibfk_1 FOREIGN KEY (client_id) REFERENCES clients (id),
  CONSTRAINT reviews_ibfk_2 FOREIGN KEY (product_id) REFERENCES products (id)
);

CREATE TABLE shopping_car (
  id INT(11) NOT NULL,
  client_id INT(11) DEFAULT NULL,
  document_type_id INT(11) DEFAULT NULL,
  product_id INT(11) DEFAULT NULL,
  dollar_prices_id INT(11) DEFAULT NULL,
  amount INT(11) DEFAULT NULL,
  date date DEFAULT NULL,
  client_address_id INT(11) DEFAULT NULL,
  PRIMARY KEY (id),
  KEY client_id (client_id),
  KEY document_type_id (document_type_id),
  KEY product_id (product_id),
  KEY dollar_prices_id (dollar_prices_id),
  KEY client_address_id (client_address_id),
  CONSTRAINT shopping_car_ibfk_1 FOREIGN KEY (client_id) REFERENCES clients (id),
  CONSTRAINT shopping_car_ibfk_2 FOREIGN KEY (document_type_id) REFERENCES document_types(id),
  CONSTRAINT shopping_car_ibfk_3 FOREIGN KEY (product_id) REFERENCES products (id),
  CONSTRAINT shopping_car_ibfk_4 FOREIGN KEY (dollar_prices_id) REFERENCES dollar_prices(id),
  CONSTRAINT shopping_car_ibfk_5 FOREIGN KEY (client_address_id) REFERENCES client_address (id)
);


