SELECT
    Country,
    FirstMonth,
    COUNT(CustomerID) AS NewCustomers
FROM (
    SELECT
        c.Country,
        o.CustomerID,
        MIN(DATE(EXTRACT(YEAR FROM OrderDate), EXTRACT(MONTH FROM OrderDate), 1)) AS FirstMonth 
        -- Buscamos la primera fecha de compra de cada cliente
    FROM `ecommerceproject-470608.Ventas.Orders` AS o
    JOIN `ecommerceproject-470608.Ventas.Customers` AS c
      ON o.CustomerID = c.CustomerID
    WHERE o.CustomerID <> ''
    GROUP BY c.Country, o.CustomerID
) AS FirstOrder
GROUP BY Country, FirstMonth
ORDER BY FirstMonth;