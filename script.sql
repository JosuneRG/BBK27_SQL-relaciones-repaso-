-- 1 - Crear BBDD 
CREATE DATABASE e-commerce;

-- Tabla User

CREATE TABLE `user` (
  `idUser` int NOT NULL AUTO_INCREMENT,
  `lastName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `firstName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `age` int DEFAULT NULL,
  PRIMARY KEY (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Tabla Product

CREATE TABLE `product` (
  `idProduct` int NOT NULL AUTO_INCREMENT,
  `nameProduct` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `idUser` int NOT NULL,
  `idCategory` int DEFAULT NULL,
  PRIMARY KEY (`idProduct`),
  KEY `product_user_fk` (`idUser`),
  KEY `product_category_fk` (`idCategory`),
  CONSTRAINT `product_category_fk` FOREIGN KEY (`idCategory`) REFERENCES `category` (`idCategory`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Tabla Order
CREATE TABLE `order` (
  `idOrder` int NOT NULL AUTO_INCREMENT,
  `orderDate` date DEFAULT NULL,
  `idProduct` int DEFAULT NULL,
  `idUser` int NOT NULL,
  PRIMARY KEY (`idOrder`),
  KEY `order_product_fk` (`idProduct`),
  KEY `order_user_fk` (`idUser`),
  CONSTRAINT `order_product_fk` FOREIGN KEY (`idProduct`) REFERENCES `product` (`idProduct`),
  CONSTRAINT `order_user_fk` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Tabla Category
CREATE TABLE `category` (
  `idCategory` int NOT NULL AUTO_INCREMENT,
  `nameCategory` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`idCategory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- 2.2.1 INSERTAR DATOS

-- Inserte al menos 5 nuevos usuarios.
INSERT INTO `user` (`lastName`, `firstName`, `age`) VALUES 
('Smith', 'John', 28),
('Doe', 'Jane', 34),
('Brown', 'Charlie', 22),
('Williams', 'Emily', 41),
('Davis', 'Michael', 30);

-- Inserte al menos 5 nuevos productos.
INSERT INTO `product` (`idProduct`, `nameProduct`, `idUser`, `idCategory`, `price`) VALUES
(26, 'Laptop', 1, 1, 50),
(27, 'Tablet', 2, 1, 500),
(28, 'T-shirt', 3, 2, 600),
(29, 'Jeans', 4, 2, 200),
(30, 'Smartwatch', 5, 1, 280);

-- Inserte al menos 5 nuevos pedidos(orders).
INSERT INTO orderP (orderDate, idProduct, idUser) VALUES 
('2025-05-01', 1, 1), 
('2025-05-02', 2, 2), 
('2025-05-03', 3, 3),  
('2025-05-04', 4, 4),  
('2025-05-05', 5, 5);  

-- Inserte al menos 2 tipos de categorías.
INSERT INTO `category` (`nameCategory`) VALUES 
('Electronics'),
('Clothing');


-- 2.2.2 ACTUALIZAR DATOS
-- 1 -Cambiar el nombre de un producto. Para ello, genera una consulta que 
-- afecte solo a un determinado producto en función de su id.
select * from product where idProduct = 27;
Update product set nameProduct='Tablet' where idProduct = 27;

-- 2 - Cambiar el precio de un producto a 50€. 
-- Para ello, genera una consulta que afecte solo a un determinado producto en función de su  id.
ALTER TABLE product ADD price INTEGER(8);
select * from product;
Update product set price = 40 where idProduct = 26;


-- 2.2.3 OBTENER DATOS
-- Selecciona todos los productos con un precio superior a 20€.
select * from product where price <20;

-- Muestra de forma descendente los productos.
select * from product order by desc;
-- Selecciona todos los productos y que muestre la categoría a la que pertenecen.
-- Selecciona todos los usuarios y muestre sus pedidos.
-- Selecciona un producto por su id y que muestre la categoría a la que pertenece.
-- Selecciona a un usuario por su id y muestra los pedidos que tiene.




-- 3. Extra
-- 3.1.1 BORRAR DATOS
-- ⦁ Elimina un producto por su id.

-- 3.2 Actualizar diagrama
-- Crea una nueva tabla reviews y añadela al diagrama, especificando también el tipo de relación.

-- 3.3. Ejecuta las siguientes consultas SQL
-- A continuación, deberás realizar las siguientes consultas SQL:
-- 3.3.1 INSERTAR DATOS

-- Inserta al menos 5 nuevas reviews.

		
-- 3.3.2 ACTUALIZAR DATOS

-- Cambia el contenido de una review

-- 3.3.3 OBTENER DATOS

-- Selecciona todas las reviews.
-- Selecciona todos los productos con sus respectivas reviews.
-- Muestra un producto con sus reviews.
-- Muestra los productos junto a la categoría a la que pertenece y sus reviews.
-- Selecciona un usuario y muestra sus pedidos junto a los productos que contiene cada pedido.

-- 3.3.4 BORRAR DATOS

-- ⦁ Elimina una review por su id.
 


		