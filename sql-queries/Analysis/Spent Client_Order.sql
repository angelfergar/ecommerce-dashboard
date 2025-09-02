SELECT 
    c.Country,
    c.CustomerID,
    orp.OrderID,
    o.OrderDate,
    ROUND(SUM(orp.Quantity * orp.UnitPrice),2) AS PurchaseTotal
FROM `ecommerceproject-470608.Ventas.OrderProducts` AS orp
JOIN `ecommerceproject-470608.Ventas.Orders` AS o ON orp.OrderID = o.OrderID
JOIN `ecommerceproject-470608.Ventas.Customers` AS c ON o.CustomerID = c.CustomerID
WHERE c.CustomerID <> ''
GROUP BY orp.OrderID, c.CustomerID, c.Country,o.OrderDate
ORDER BY PurchaseTotal DESC;
