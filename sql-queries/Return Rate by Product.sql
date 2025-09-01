SELECT 
    p.ProductID,
    p.ProductName,
    ROUND(
        SUM(CASE WHEN orp.Quantity < 0 THEN ABS(Quantity) ELSE 0 END) /
        NULLIF(SUM(CASE WHEN orp.Quantity > 0 THEN Quantity ELSE 0 END),0),2) AS ReturnRatio,
    ROUND(
        SUM(CASE WHEN orp.Quantity < 0 THEN ABS(orp.Quantity * orp.UnitPrice) ELSE 0 END) /
        NULLIF(SUM(CASE WHEN orp.Quantity > 0 THEN (orp.Quantity * orp.UnitPrice) ELSE 0 END),0),2) AS ReturnCostRatio
FROM `ecommerceproject-470608.Ventas.OrderProducts` AS orp
JOIN `ecommerceproject-470608.Ventas.Products` AS p ON orp.ProductID = p.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY ReturnRatio DESC;