CREATE SCHEMA dz2;

CREATE TABLE dz2.customers(
	id BIGSERIAL PRIMARY KEY,
	name VARCHAR(50),
	surname VARCHAR(50),
	age INTEGER CHECK (age BETWEEN 0 AND 100),
	phone_number VARCHAR(11) NOT NULL UNIQUE
);

CREATE TABLE dz2.orders(
	id BIGSERIAL PRIMARY KEY,
	date DATE,
	customer_id BIGINT NOT NULL,
	product_name VARCHAR(200) NOT NULL,
	amount INTEGER CHECK (amount >= 0),
	FOREIGN KEY (customer_id) REFERENCES dz2.customers(id)
);

INSERT INTO dz2.customers (name, surname, age, phone_number)
VALUES
    ('Danil', 'Ponomarev', 25, '89624331267'),
    ('Ivan', 'Petrov', 34, '89623339076'),
    ('Anna', 'Smirnova', 22, '89161234567'),
    ('Maria', 'Sokolova', 29, '89262345678'),
    ('Alexey', 'Volkov', 41, '89363456789');

INSERT INTO dz2.orders (date, customer_id, product_name, amount)
VALUES
    ('2026-11-15', 1, 'MacBook Pro', 150000),
    ('2026-11-16', 2, 'iPhone 16', 90000),
    ('2026-11-17', 3, 'Samsung Galaxy S25', 85000),
    ('2026-11-18', 4, 'AirPods Pro', 25000),
    ('2026-11-19', 5, 'iPad Air', 70000),
    ('2026-11-19', 5, 'PlayStation 5 Pro', 100000);

SELECT customers.name, orders.product_name
FROM dz2.customers AS customers
JOIN dz2.orders AS orders
ON customers.id = orders.customer_id WHERE customers.name ILIKE '%alexey%';