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
SELECT o.officeCode, o.city, SUM(od.quantityOrdered * od.priceEach) AS total_sales
FROM offices o
JOIN employees e ON o.officeCode = e.officeCode
JOIN customers c ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN orders od ON c.customerNumber = od.customerNumber
JOIN orderdetails o ON od.orderNumber = o.orderNumber
GROUP BY o.officeCode
ORDER BY total_sales DESC
LIMIT 1;

-- Q5. 
SELECT o.officeCode, o.city, SUM(odetail.quantityOrdered * odetail.priceEach) AS total_sales
FROM offices o
JOIN employees e ON o.officeCode = e.officeCode
JOIN customers c ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN orders o_order ON c.customerNumber = o_order.customerNumber
JOIN orderdetails odetail ON o_order.orderNumber = odetail.orderNumber
GROUP BY o.officeCode
ORDER BY total_sales DESC
LIMIT 1;






