DROP TABLE IF EXISTS `ecommerceproject-470608.Ventas.CleanedData`;

CREATE TABLE `ecommerceproject-470608.Ventas.CleanedData` AS
SELECT
  OrderID,
  ProductID,
  ProductName,
  Quantity,
  -- Ajustamos el formato de fecha
  PARSE_DATETIME('%m/%d/%Y %H:%M', OrderDate) AS OrderDate, 
  UnitPrice,
  CustomerID,
  Country
 FROM `ecommerceproject-470608.Ventas.RawData`