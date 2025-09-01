SELECT
    c.Country,
    EXTRACT(YEAR FROM OrderDate) AS Year,
    ROUND(SUM(orp.Quantity * orp.UnitPrice),2) AS YearlySales
FROM `ecommerceproject-470608.Ventas.OrderProducts` AS orp
JOIN `ecommerceproject-470608.Ventas.Orders` AS o ON orp.OrderID = o.OrderID
JOIN `ecommerceproject-470608.Ventas.Customers` AS c ON o.CustomerID = c.CustomerID
WHERE c.CustomerID <> '' AND orp.Quantity > 0
GROUP BY c.Country, Year
ORDER BY c.Country, Year;