SELECT 
  FORMAT_DATETIME('%A', o.OrderDate) AS WeekDay,
  ROUND(SUM(orp.Quantity * orp.UnitPrice), 2) AS DailySales
FROM `ecommerceproject-470608.Ventas.OrderProducts` AS orp
JOIN `ecommerceproject-470608.Ventas.Orders` AS o
  ON orp.OrderID = o.OrderID
WHERE o.CustomerID IS NOT NULL AND o.CustomerID <> '' 
  AND orp.Quantity > 0
GROUP BY WeekDay, EXTRACT(DAYOFWEEK FROM o.OrderDate)
ORDER BY EXTRACT(DAYOFWEEK FROM o.OrderDate); -- Ordenamos por día de la semana