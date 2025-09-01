SELECT
    c.Country,
    c.CustomerID,
    COUNT(o.OrderID) AS NumOrders
FROM `ecommerceproject-470608.Ventas.Orders` AS o
JOIN `ecommerceproject-470608.Ventas.Customers` AS c ON o.CustomerID = c.CustomerID
WHERE o.CustomerID IN(
    SELECT CustomerID
    FROM `ecommerceproject-470608.Ventas.Orders`
    GROUP BY CustomerID
    HAVING COUNT(OrderID) >1 -- Con esto solo obtenemos los clientes que han hecho más de un pedido
)
GROUP BY c.CustomerID, c.Country;