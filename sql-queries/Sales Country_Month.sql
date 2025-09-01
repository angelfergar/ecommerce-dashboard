SELECT 
    c.Country,
    FORMAT_DATETIME('%Y-%m', OrderDate) AS Month,
    ROUND(SUM(orp.Quantity * orp.UnitPrice), 2) AS MonthlySales,
    ROUND(
        SUM(orp.Quantity * orp.UnitPrice) /
        SUM(SUM(orp.Quantity * orp.UnitPrice)) OVER (), 2
    ) AS PctOfTotal
    -- % del total utilizando función window
FROM `ecommerceproject-470608.Ventas.OrderProducts` AS orp
JOIN `ecommerceproject-470608.Ventas.Orders` AS o ON orp.OrderID = o.OrderID
JOIN `ecommerceproject-470608.Ventas.Customers` AS c ON o.CustomerID = c.CustomerID
WHERE o.CustomerID <> '' AND orp.Quantity > 0
GROUP BY c.Country, Month
ORDER BY Month;