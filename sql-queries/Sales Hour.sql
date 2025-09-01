SELECT
  EXTRACT(HOUR FROM o.OrderDate) AS Hour,  -- Extrae la hora de 0 a 23
  ROUND(SUM(orp.Quantity * orp.UnitPrice), 2) AS HourlySales
FROM `ecommerceproject-470608.Ventas.OrderProducts` AS orp
JOIN `ecommerceproject-470608.Ventas.Orders` AS o
  ON orp.OrderID = o.OrderID
WHERE o.CustomerID IS NOT NULL AND o.CustomerID <> '' AND orp.Quantity > 0
GROUP BY Hour
ORDER BY Hour;