/*CREATE TABLE STATEMENTS*/

/* ORDERS TABLE */
CREATE TABLE orders (
order_id int NOT NULL AUTO_INCREMENT,
customer_name varchar(100) NOT NULL,
total double NOT NULL,
datetime datetime NOT NULL,
CONSTRAINT pk_o PRIMARY KEY (order_id));

/* UOM TABLE */
CREATE TABLE uom (
uom_id int NOT NULL AUTO_INCREMENT,
uom_name varchar(45) NOT NULL,
CONSTRAINT pk_uom PRIMARY KEY (uom_id)) ;


/* PRODUCTS TABLE */
CREATE TABLE products (
product_id int NOT NULL AUTO_INCREMENT,
name varchar(100) NOT NULL,
uom_id int NOT NULL,
price_per_unit double NOT NULL,
CONSTRAINT pk_produ PRIMARY KEY (product_id),
CONSTRAINT fk_uom_id FOREIGN KEY (uom_id) REFERENCES uom(uom_id) ON UPDATE RESTRICT);

/* ORDER-DETAILS TABLE */
CREATE TABLE order_details (
order_id int NOT NULL,
product_id int NOT NULL,
quantity double NOT NULL,
total_price double NOT NULL,
CONSTRAINT pk_od PRIMARY KEY (order_id,product_id),
CONSTRAINT fk_order_id FOREIGN KEY (order_id) REFERENCES orders(order_id) ON UPDATE RESTRICT,
CONSTRAINT fk_product_id FOREIGN KEY (product_id) REFERENCES products(product_id) ON UPDATE RESTRICT);

/* ACCOUNTS TABLE */
CREATE TABLE accounts (
id int NOT NULL AUTO_INCREMENT,
username varchar(45) NOT NULL,
password varchar(45) NOT NULL,
email varchar(45) NOT NULL,
CONSTRAINT pk_id PRIMARY KEY (id));


/*INSERT STATEMENTS*/
INSERT INTO orders VALUES(1,"AADYA",370,"2023-01-29 12:22:12");

INSERT INTO uom VALUES(1,"kg");

INSERT INTO products VALUES(1,"Turmeric",1,120);
INSERT INTO products VALUES( 12, "Colgate Toothpaste", 2,37.5); 

INSERT INTO order_details VALUES(1,1,3,510); 

INSERT INTO accounts VALUES( 1,Sahana,sahana,sahana@gmail.com);



/*TRIGGERS*/
CREATE DEFINER=`root`@`localhost` TRIGGER `orders_BEFORE_INSERT` BEFORE INSERT ON `orders` FOR EACH ROW BEGIN
IF new.customer_name IS NULL THEN
SET new.customer_name= "NAME MANDATORY";
END IF;
END




/*STORED PROCEDURES*/
CREATE DEFINER=`root`@`localhost` PROCEDURE `cust_details`(IN customer_name VARCHAR(100))
BEGIN
SELECT customer_name, order_id, datetime, total
FROM orders
WHERE customer_name= orders.customer_name;
END

CREATE DEFINER=`root`@`localhost` PROCEDURE `price_above_500`()
BEGIN
SELECT customer_name, total 
FROM orders
WHERE total>500;
END




