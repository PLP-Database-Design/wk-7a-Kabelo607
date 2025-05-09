WITH SplitProducts AS (
    SELECT
        OrderID,
        CustomerName,
        LTRIM(RTRIM(value)) AS Product
    FROM ProductDetail
    CROSS APPLY STRING_SPLIT(Products, ',')
)
SELECT OrderID, CustomerName, Product
FROM SplitProducts
ORDER BY OrderID;

-- Create Orders table with unique orders and CustomerNames
CREATE TABLE Orders AS
SELECT DISTINCT OrderID, CustomerName
FROM OrderDetails;

<p>-- Create OrderDetails_2NF table containing OrderID, Product, and Quantity
CREATE TABLE OrderDetails_2NF AS
SELECT OrderID, Product, Quantity
FROM OrderDetails;</p>