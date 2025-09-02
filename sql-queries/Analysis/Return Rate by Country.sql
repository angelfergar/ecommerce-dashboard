SELECT 
    c.Country,
    ROUND(
        SUM(CASE WHEN orp.Quantity < 0 THEN ABS(Quantity) ELSE 0 END) /
        NULLIF(SUM(CASE WHEN orp.Quantity > 0 THEN Quantity ELSE 0 END),0),2) AS ReturnRatio,
    ROUND(
        SUM(CASE WHEN orp.Quantity < 0 THEN ABS(orp.Quantity * orp.UnitPrice) ELSE 0 END) /
        NULLIF(SUM(CASE WHEN orp.Quantity > 0 THEN (orp.Quantity * orp.UnitPrice) ELSE 0 END),0),2) AS ReturnCostRatio
FROM `ecommerceproject-470608.Ventas.OrderProducts` AS orp
JOIN `ecommerceproject-470608.Ventas.Orders` AS o ON orp.OrderID = o.OrderID
JOIN `ecommerceproject-470608.Ventas.Customers` AS c ON o.CustomerID = c.CustomerID
WHERE c.CustomerID <> ''
GROUP BY c.Country
ORDER BY ReturnRatio DESC;