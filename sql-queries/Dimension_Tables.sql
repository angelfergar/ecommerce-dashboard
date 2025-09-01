-- Eliminamos las tablas existentes para poder recrear el modelo de cero
DROP TABLE IF EXISTS `ecommerceproject-470608.Ventas.OrderProducts`;
DROP TABLE IF EXISTS `ecommerceproject-470608.Ventas.Orders`;
DROP TABLE IF EXISTS `ecommerceproject-470608.Ventas.Products`;
DROP TABLE IF EXISTS `ecommerceproject-470608.Ventas.Customers`;

-- Tabla Customers
CREATE TABLE `ecommerceproject-470608.Ventas.Customers` AS
SELECT
  TRIM(CustomerID) AS CustomerID,
  MIN(TRIM(Country)) AS Country 
  -- Si un cliente aparece con varios países, se elige el primero alfabéticamente
FROM `ecommerceproject-470608.Ventas.CleanedData`
WHERE CustomerID IS NOT NULL 
  AND TRIM(CustomerID) <> ''  -- eliminamos IDs vacíos
GROUP BY TRIM(CustomerID);

-- Tabla Products
CREATE TABLE `ecommerceproject-470608.Ventas.Products` AS
SELECT
  TRIM(ProductID) AS ProductID,
  MIN(TRIM(ProductName)) AS ProductName, 
  -- Usamos MIN() para evitar conflictos con los duplicados
	MIN(UnitPrice) AS UnitPrice
  -- En caso de duplicados, elegimos el menor precio
FROM `ecommerceproject-470608.Ventas.CleanedData`
WHERE ProductID IS NOT NULL 
	AND ProductName IS NOT NULL
    AND UnitPrice > 0 
    -- Hay ProductName vacíos o no válidos que tienen UnitPrice a 0
GROUP BY TRIM(ProductID);

-- Tabla Orders
CREATE TABLE `ecommerceproject-470608.Ventas.Orders` AS
SELECT
  TRIM(OrderID) AS OrderID, 
	MIN(TRIM(CustomerID)) AS CustomerID, 
  -- Usamos MIN() para evitar conflictos con los duplicados
	MIN(OrderDate) AS OrderDate
  -- En caso de duplicados, escogemos la fecha más temprana
FROM `ecommerceproject-470608.Ventas.CleanedData`
WHERE OrderID IS NOT NULL AND TRIM(OrderID) <> ''
GROUP BY TRIM(OrderID);

-- Tabla OrderProducts
CREATE TABLE `ecommerceproject-470608.Ventas.OrderProducts` AS
SELECT
  ROW_NUMBER() OVER() AS OrderProductID,
  OrderID,
  ProductID,
  Quantity,
  UnitPrice
FROM `ecommerceproject-470608.Ventas.CleanedData`
WHERE OrderID IS NOT NULL AND ProductID IS NOT NULL;