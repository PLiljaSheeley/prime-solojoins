--Get all customers and their addresses.

SELECT addresses.street, addresses.city, addresses.state, addresses.zip, customers.first_name, customers.last_name
FROM addresses
INNER JOIN customers
ON addresses.customer_id=customers.id;

--Get all orders and their line items.

SELECT *
FROM orders
LEFT JOIN line_items
ON line_items.order_id=orders.id

--Which warehouses have cheetos?

SELECT products.description, warehouse
FROM products INNER JOIN warehouse_product
   ON products.id = warehouse_product.product_id JOIN warehouse
   ON warehouse.id = warehouse_product.warehouse_id
WHERE products.description = 'cheetos'

--Which warehouses have diet pepsi?

SELECT products.description, warehouse
FROM products INNER JOIN warehouse_product
   ON products.id = warehouse_product.product_id JOIN warehouse
   ON warehouse.id = warehouse_product.warehouse_id
WHERE product_id = '6'

--Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.

SELECT customers.first_name, customers.last_name, orders.total
FROM addresses INNER JOIN orders
   ON addresses.id = orders.address_id JOIN customers
   ON customers.id = addresses.customer_id

--How many customers do we have?

SELECT COUNT(customers.id) FROM customers;

--How many products do we carry?

SELECT COUNT(products.id) FROM products;

--What is the total available on-hand quantity of diet pepsi?

SELECT SUM(warehouse_product.on_hand) FROM warehouse_product
WHERE product_id = '6'