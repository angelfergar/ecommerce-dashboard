SELECT 
    c.Country,
    FORMAT_DATE('%Y-%m',o.OrderDate) AS Month,
    SUM(ABS(orp.Quantity)) AS Returns,
    ROUND(
        SUM(ABS(orp.Quantity)) /
        SUM(SUM(ABS(orp.Quantity))) OVER (), 2) AS PctOfTotal_Quantity,
    ROUND(SUM(ABS(orp.Quantity * orp.UnitPrice)),2) AS ReturnCost,
    ROUND(
        SUM(ABS(orp.Quantity * orp.UnitPrice)) /
        SUM(SUM(ABS(orp.Quantity * orp.UnitPrice))) OVER (), 2) AS PctOfTotal_Cost
FROM `ecommerceproject-470608.Ventas.OrderProducts` AS orp
JOIN `ecommerceproject-470608.Ventas.Orders` AS o ON orp.OrderID = o.OrderID
JOIN `ecommerceproject-470608.Ventas.Customers` AS c ON o.CustomerID = c.CustomerID
WHERE c.CustomerID <> '' AND orp.Quantity < 0
GROUP BY c.Country, Month
ORDER BY Returns DESC;