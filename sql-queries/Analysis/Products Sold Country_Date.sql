SELECT
    c.Country,
    p.ProductID,
    p.ProductName,
    o.OrderDate,
    ROUND(SUM(orp.Quantity * orp.UnitPrice),2) AS TotalPurchased
FROM `ecommerceproject-470608.Ventas.OrderProducts` AS orp
JOIN `ecommerceproject-470608.Ventas.Orders` AS o ON orp.OrderID = o.OrderID
JOIN `ecommerceproject-470608.Ventas.Customers` AS c ON o.CustomerID = c.CustomerID
JOIN `ecommerceproject-470608.Ventas.Products` AS p ON orp.ProductID = p.ProductID
WHERE c.CustomerID <> '' AND orp.Quantity > 0
GROUP BY c.Country, p.ProductID, p.ProductName, o.OrderDate
ORDER BY TotalPurchased DESC;