SELECT
    c.Country,
    o.CustomerID,
    ROUND(SUM(orp.Quantity * orp.UnitPrice), 2) AS TotalSpent
FROM `ecommerceproject-470608.Ventas.OrderProducts` AS orp
JOIN `ecommerceproject-470608.Ventas.Orders` AS o ON orp.OrderID = o.OrderID
JOIN `ecommerceproject-470608.Ventas.Customers` AS c ON o.CustomerID = c.CustomerID
WHERE o.CustomerID <> '' AND orp.Quantity > 0
GROUP BY c.Country,o.CustomerID
ORDER BY TotalSpent DESC;