SELECT
    c.Country,
    c.CustomerID,
    o.OrderDate,
    SUM(ABS(orp.Quantity)) AS Returns,
    ROUND(SUM(ABS(orp.Quantity * orp.UnitPrice)),2) AS ReturnCost
FROM `ecommerceproject-470608.Ventas.OrderProducts` AS orp
JOIN `ecommerceproject-470608.Ventas.Orders` AS o ON orp.OrderID = o.OrderID
JOIN `ecommerceproject-470608.Ventas.Customers` AS c ON o.CustomerID = c.CustomerID
WHERE c.CustomerID <> '' AND orp.Quantity < 0
GROUP BY c.Country, c.CustomerID, o.OrderDate
ORDER BY ReturnCost DESC;