SELECT
    c.Country,
    FORMAT_DATE('%Y-%m',o.OrderDate) AS Month,
    ROUND(
        SUM(CASE WHEN orp.Quantity > 0 THEN (orp.Quantity * orp.UnitPrice) ELSE 0 END) -
        SUM(CASE WHEN orp.Quantity < 0 THEN ABS(orp.Quantity * orp.UnitPrice) ELSE 0 END),2
    ) AS NetRevenue
FROM `ecommerceproject-470608.Ventas.OrderProducts` AS orp
JOIN `ecommerceproject-470608.Ventas.Orders` AS o ON orp.OrderID = o.OrderID
JOIN `ecommerceproject-470608.Ventas.Customers` AS c ON o.CustomerID = c.CustomerID
GROUP BY c.Country, Month
ORDER BY NetRevenue DESC;