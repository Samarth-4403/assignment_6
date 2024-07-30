USE classicmodels;

-- Q1. 
SELECT COUNT(*) FROM productlines;

-- Q2.
SELECT customerNumber, SUM(amount) AS total_spent
FROM payments
GROUP BY customerNumber
ORDER BY total_spent DESC
LIMIT 10;

-- Q3. 
SELECT e.employeeNumber, e.firstName, e.lastName, SUM(od.quantityOrdered * od.priceEach) AS total_sales
FROM employees e
JOIN customers c ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN orders o ON c.customerNumber = o.customerNumber
JOIN orderdetails od ON o.orderNumber = od.orderNumber
GROUP BY e.employeeNumber
ORDER BY total_sales DESC
LIMIT 10;

-- Q4. 
SELECT off.officeCode, off.city, SUM(odet.quantityOrdered * odet.priceEach) AS total_sales
FROM offices off
JOIN employees emp ON off.officeCode = emp.officeCode
JOIN customers cust ON emp.employeeNumber = cust.salesRepEmployeeNumber
JOIN orders ord ON cust.customerNumber = ord.customerNumber
JOIN orderdetails odet ON ord.orderNumber = odet.orderNumber
GROUP BY off.officeCode, off.city
ORDER BY total_sales DESC
LIMIT 1;


-- Q5. 
SELECT productCode, SUM(quantityOrdered) AS total_quantity, SUM(quantityOrdered * priceEach) AS total_sales
FROM orderdetails
GROUP BY productCode
ORDER BY total_quantity DESC;

-- Q6
 SELECT MONTH(o.orderDate) AS month, SUM(od.quantityOrdered) AS total_items_ordered
FROM orders o
JOIN orderdetails od ON o.orderNumber = od.orderNumber
GROUP BY month
ORDER BY total_items_ordered DESC
LIMIT 1;

-- Q7 
SELECT YEAR(orderDate) AS year, COUNT(*) AS total_orders
FROM orders
GROUP BY year
ORDER BY year;

-- Q8 
SELECT MONTH(orderDate) AS month, COUNT(*) AS total_orders
FROM orders
GROUP BY month
ORDER BY total_orders DESC
LIMIT 1;

-- Q9
SELECT orderDate, AVG(total_units) OVER (ORDER BY orderDate ROWS BETWEEN 30 PRECEDING AND CURRENT ROW) AS avg_units_shipped
FROM (
    SELECT orderDate, SUM(quantityOrdered) AS total_units
    FROM orders o
    JOIN orderdetails od ON o.orderNumber = od.orderNumber
    GROUP BY orderDate
) AS daily_totals;

-- Q10
SELECT YEAR(o.orderDate) AS year, SUM(od.quantityOrdered * od.priceEach) AS total_revenue
FROM orders o
JOIN orderdetails od ON o.orderNumber = od.orderNumber
GROUP BY year
ORDER BY year;

-- Q11
SELECT p.productLine, SUM(od.quantityOrdered * od.priceEach) AS total_sales
FROM products p
JOIN orderdetails od ON p.productCode = od.productCode
GROUP BY p.productLine
ORDER BY total_sales DESC
LIMIT 1;

-- Q12
SELECT productLine, SUM(quantityInStock) AS total_quantity_in_stock
FROM products
GROUP BY productLine
ORDER BY total_quantity_in_stock DESC
LIMIT 1;

-- Q13
SELECT p.productLine, p.productName, SUM(od.quantityOrdered * od.priceEach) AS total_sales
FROM products p
JOIN orderdetails od ON p.productCode = od.productCode
GROUP BY p.productLine, p.productCode
ORDER BY p.productLine, total_sales DESC;

-- Q14
SELECT p.productName, SUM(od.quantityOrdered * od.priceEach) AS total_revenue
FROM products p
JOIN orderdetails od ON p.productCode = od.productCode
GROUP BY p.productCode
ORDER BY total_revenue DESC
LIMIT 10;

-- Q15
SELECT productName, quantityInStock
FROM products
ORDER BY quantityInStock DESC
LIMIT 10;





