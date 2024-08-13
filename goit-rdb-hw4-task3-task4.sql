USE mydb;

-- ===================================
-- Task 3 - all tables select join
-- ===================================
SELECT *
FROM orders o
INNER JOIN order_details od ON o.id = od.order_id
INNER JOIN customers c ON o.customer_id = c.id
INNER JOIN employees e ON o.employee_id = e.employee_id
INNER JOIN shippers sh ON o.shipper_id = sh.id
INNER JOIN products p ON od.product_id = p.id
INNER JOIN categories ct ON p.category_id = ct.id
INNER JOIN suppliers ss ON p.supplier_id = ss.id;

-- ===================================
-- Task 4
-- ===================================
-- p1
SELECT COUNT(*)
FROM orders o
INNER JOIN order_details od ON o.id = od.order_id
INNER JOIN customers c ON o.customer_id = c.id
INNER JOIN employees e ON o.employee_id = e.employee_id
INNER JOIN shippers sh ON o.shipper_id = sh.id
INNER JOIN products p ON od.product_id = p.id
INNER JOIN categories ct ON p.category_id = ct.id
INNER JOIN suppliers ss ON p.supplier_id = ss.id;

-- p2
SELECT COUNT(*)
FROM orders o
INNER JOIN order_details od ON o.id = od.order_id
INNER JOIN customers c ON o.customer_id = c.id
LEFT JOIN employees e ON o.employee_id = e.employee_id
RIGHT JOIN shippers sh ON o.shipper_id = sh.id
INNER JOIN products p ON od.product_id = p.id
INNER JOIN categories ct ON p.category_id = ct.id
INNER JOIN suppliers ss ON p.supplier_id = ss.id;
-- left join allows for the table on the left to be listed in full while only records available from the right will have non NULL values. 
-- This essentially increases the count by size of employees table. Similar story with RIGHT JOIN, yet the right table gets featured - 
-- in this case shippers, thus shippers will be repeated on each row combination

-- p3
SELECT *
FROM orders o
INNER JOIN order_details od ON o.id = od.order_id
INNER JOIN customers c ON o.customer_id = c.id
INNER JOIN employees e ON o.employee_id = e.employee_id
INNER JOIN shippers sh ON o.shipper_id = sh.id
INNER JOIN products p ON od.product_id = p.id
INNER JOIN categories ct ON p.category_id = ct.id
INNER JOIN suppliers ss ON p.supplier_id = ss.id
WHERE e.employee_id BETWEEN 4 AND 10;

-- p4
SELECT ct.name, COUNT(*), AVG(od.quantity)
FROM orders o
INNER JOIN order_details od ON o.id = od.order_id
INNER JOIN customers c ON o.customer_id = c.id
INNER JOIN employees e ON o.employee_id = e.employee_id
INNER JOIN shippers sh ON o.shipper_id = sh.id
INNER JOIN products p ON od.product_id = p.id
INNER JOIN categories ct ON p.category_id = ct.id
INNER JOIN suppliers ss ON p.supplier_id = ss.id
GROUP BY ct.name;

-- p5
SELECT ct.name, COUNT(*), AVG(od.quantity)
FROM orders o
INNER JOIN order_details od ON o.id = od.order_id
INNER JOIN customers c ON o.customer_id = c.id
INNER JOIN employees e ON o.employee_id = e.employee_id
INNER JOIN shippers sh ON o.shipper_id = sh.id
INNER JOIN products p ON od.product_id = p.id
INNER JOIN categories ct ON p.category_id = ct.id
INNER JOIN suppliers ss ON p.supplier_id = ss.id
GROUP BY ct.name
HAVING COUNT(*) > 21;

-- p6
SELECT ct.name, COUNT(*) cnt, AVG(od.quantity) q
FROM orders o
INNER JOIN order_details od ON o.id = od.order_id
INNER JOIN customers c ON o.customer_id = c.id
INNER JOIN employees e ON o.employee_id = e.employee_id
INNER JOIN shippers sh ON o.shipper_id = sh.id
INNER JOIN products p ON od.product_id = p.id
INNER JOIN categories ct ON p.category_id = ct.id
INNER JOIN suppliers ss ON p.supplier_id = ss.id
GROUP BY ct.name
HAVING COUNT(*) > 21
ORDER BY cnt DESC;

-- p6
SELECT ct.name, COUNT(*) cnt, AVG(od.quantity) q
FROM orders o
INNER JOIN order_details od ON o.id = od.order_id
INNER JOIN customers c ON o.customer_id = c.id
INNER JOIN employees e ON o.employee_id = e.employee_id
INNER JOIN shippers sh ON o.shipper_id = sh.id
INNER JOIN products p ON od.product_id = p.id
INNER JOIN categories ct ON p.category_id = ct.id
INNER JOIN suppliers ss ON p.supplier_id = ss.id
GROUP BY ct.name
HAVING COUNT(*) > 21
ORDER BY cnt DESC
LIMIT 4 OFFSET 1;