CREATE TABLE categories (
  category_id INT PRIMARY KEY,
  category_name VARCHAR(50)
);

CREATE TABLE products (
  id INT PRIMARY KEY,
  name VARCHAR(50),
  price FLOAT,
  quantity INT,
  category_id INT,
  FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

CREATE TABLE sales (
  sale_id INT PRIMARY KEY,
  product_id INT,
  sale_date DATE,
  quantity_sold INT,
  FOREIGN KEY (product_id) REFERENCES products(id)
);

INSERT INTO categories (category_id, category_name)
VALUES
  (1, 'Овощи'),
  (2, 'Фрукты'),
  (3, 'Молочные продукты');

INSERT INTO products (id, name, price, quantity, category_id)
VALUES
  (1, 'Апельсины', 30, 68, 2),
  (2, 'Яблоки', 20, 73, 2),
  (3, 'Огурцы', 17, 34, 1),
  (4, 'Помидоры', 23, 42, 1),
  (5, 'Мандарины', 26, 93, 2),
  (6, 'Йогурт', 39, 24, 3),
  (7, 'Творог', 65, 20, 3),
  (8, 'Морковь', 12, 56, 1);

INSERT INTO sales (sale_id, product_id, sale_date, quantity_sold)
VALUES
  (1, 1, '2025-11-01', 13),
  (2, 2, '2025-11-01', 15),
  (3, 3, '2025-11-02', 5),
  (4, 4, '2025-11-03', 3),
  (5, 5, '2025-11-03', 8),
  (6, 6, '2025-11-02', 2),
  (7, 7, '2025-11-03', 1),
  (8, 8, '2025-11-04', 9),
  (9, 6, '2025-11-04', 3),
  (10, 4, '2025-11-05', 6),

  (11, 1, '2025-11-05', 4);


SELECT * FROM products
WHERE category_id = '2';


SELECT * FROM products
WHERE quantity < 30;


SELECT 
    SUM(sales.quantity_sold) 
FROM sales
WHERE sales.sale_date BETWEEN '2025-11-01' AND '2025-11-05';


UPDATE products 
SET quantity = quantity - 
    (SELECT SUM(quantity_sold) 
     FROM sales 
     WHERE sales.product_id = products.id);

SELECT * FROM products;
