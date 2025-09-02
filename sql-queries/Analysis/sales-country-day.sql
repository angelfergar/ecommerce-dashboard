SELECT
    c.Country,
    DATE(o.OrderDate) AS Day,
    ROUND(SUM(orp.Quantity * orp.UnitPrice),2) AS DailySales
FROM `ecommerceproject-470608.Ventas.OrderProducts` AS orp
JOIN `ecommerceproject-470608.Ventas.Orders` AS o ON orp.OrderID = o.OrderID
JOIN `ecommerceproject-470608.Ventas.Customers` AS c ON o.CustomerID = c.CustomerID
WHERE o.CustomerID <> '' AND orp.Quantity > 0
GROUP BY c.Country, Day
ORDER BY Day;