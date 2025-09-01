SELECT
    c.Country,
    DATE(EXTRACT(YEAR FROM OrderDate), EXTRACT(MONTH FROM OrderDate), 1) AS Month,
    COUNT(DISTINCT(c.CustomerID)) AS UniqueCustomers
FROM `ecommerceproject-470608.Ventas.Orders` AS o
JOIN `ecommerceproject-470608.Ventas.Customers` AS c ON o.CustomerID = c.CustomerID
WHERE c.CustomerID <> ''
GROUP BY c.Country, Month
ORDER BY Month;