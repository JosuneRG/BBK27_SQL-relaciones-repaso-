
-- 1 - Crear BBDD 
CREATE DATABASE e-commerce;

-- Tabla User

CREATE TABLE `user` (
  `idUser` int NOT NULL AUTO_INCREMENT,
  `lastName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `firstName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `age` int DEFAULT NULL,
  PRIMARY KEY (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Tabla Product

CREATE TABLE `product` (
  `idProduct` int NOT NULL AUTO_INCREMENT,
  `nameProduct` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `idUser` int NOT NULL,
  `idCategory` int DEFAULT NULL,
  `price` int DEFAULT NULL,
  PRIMARY KEY (`idProduct`),
  KEY `product_user_fk` (`idUser`),
  KEY `product_category_fk` (`idCategory`),
  CONSTRAINT `product_category_fk` FOREIGN KEY (`idCategory`) REFERENCES `category` (`idCategory`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Tabla Order
CREATE TABLE `orderp` (
  `idOrder` int NOT NULL AUTO_INCREMENT,
  `orderDate` date DEFAULT NULL,
  `idProduct` int DEFAULT NULL,
  `idUser` int NOT NULL,
  PRIMARY KEY (`idOrder`),
  KEY `order_product_fk` (`idProduct`),
  KEY `order_user_fk` (`idUser`),
  CONSTRAINT `order_product_fk` FOREIGN KEY (`idProduct`) REFERENCES `product` (`idProduct`),
  CONSTRAINT `order_user_fk` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Tabla Category
CREATE TABLE `category` (
  `idCategory` int NOT NULL AUTO_INCREMENT,
  `nameCategory` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`idCategory`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


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
select * from product order by idProduct desc;

-- Selecciona todos los productos y que muestre la categoría a la que pertenecen.
select  product.nameProduct, category.nameCategory from product 
inner join category
where product.idCategory = category.idCategory;

-- Selecciona todos los usuarios y muestre sus pedidos.
select * from orderP
inner join user
where orderP.idUser = user.idUser;

-- Selecciona un producto por su id y que muestre la categoría a la que pertenece.
select * from product 
  inner join category
  on product.idCategory = category.idCategory
where product.idCategory = 1;

-- Selecciona a un usuario por su id y muestra los pedidos que tiene.
select * from orderP where orderP.idUser = 15;

-- 3. Extra
-- 3.1.1 BORRAR DATOS
-- ⦁ Elimina un producto por su id.
delete * from product where product.idProduct = 26;

-- 3.2 Actualizar diagrama
-- Crea una nueva tabla reviews y añadela al diagrama, especificando también el tipo de relación.
CREATE TABLE `reviews` (
  `idReviews` int NOT NULL AUTO_INCREMENT,
  `idProduct` int NOT NULL,
  `Comments` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idReviews`),
  KEY `reviews_product_FK` (`idProduct`),
  CONSTRAINT `reviews_product_FK` FOREIGN KEY (`idProduct`) REFERENCES `product` (`idProduct`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 3.3. Ejecuta las siguientes consultas SQL
-- A continuación, deberás realizar las siguientes consultas SQL:
-- 3.3.1 INSERTAR DATOS
-- Inserta al menos 5 nuevas reviews.
INSERT INTO reviews (idProduct, Comments) VALUES (26, 'Muy buen producto, lo recomiendo.');
INSERT INTO reviews (idProduct, Comments) VALUES (27, 'Llegó a tiempo y en buen estado.');
INSERT INTO reviews (idProduct, Comments) VALUES (28, 'La calidad no es la esperada.');
INSERT INTO reviews (idProduct, Comments) VALUES (29, 'Excelente atención al cliente.');
INSERT INTO reviews (idProduct, Comments) VALUES (30, 'Volvería a comprar este producto.');

		
-- 3.3.2 ACTUALIZAR DATOS
-- Cambia el contenido de una review
update reviews set reviews.Comments= 'Producto recomendable' where reviews.idReviews = 1;

-- 3.3.3 OBTENER DATOS
-- Selecciona todas las reviews.
select * from reviews;

-- Selecciona todos los productos con sus respectivas reviews.
select  * from reviews
inner join product
on reviews.idProduct = product.idProduct;

-- Muestra un producto con sus reviews.
select  * from reviews
inner join product
on reviews.idProduct = product.idProduct
where reviews.idProduct = 26;

-- Muestra los productos junto a la categoría a la que pertenece y sus reviews.
SELECT 
  product.idProduct,
  product.nameProduct AS productName,
  category.nameCategory AS categoryName,
  reviews.Comments
FROM product
INNER JOIN category 
  ON product.idCategory = category.idCategory
INNER JOIN reviews 
  ON product.idProduct = reviews.idProduct;

-- Selecciona un usuario y muestra sus pedidos junto a los productos que contiene cada pedido.

SELECT 
  user.idUser,
  user.firstName AS userName,
  orderP.idOrder,
  product.idProduct,
  product.nameProduct AS productName
FROM user
INNER JOIN orderP
  ON user.idUser = orderP.idUser
INNER JOIN product
  ON orderP.idProduct = product.idProduct;


-- 3.3.4 BORRAR DATOS
-- ⦁ Elimina una review por su id.
delete *from reviews where reviews.idReviews = 1;
 


		