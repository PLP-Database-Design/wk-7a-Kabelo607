#Question 1
SELECT
    OrderID,
    [Customer Name],
    LTRIM(RTRIM(value)) AS Product
FROM
    ProductDetail
    CROSS APPLY STRING_SPLIT(Products, ',')
ORDER BY
    OrderID;

#Question 2
-- Step 1: Create Orders table with OrderID and CustomerName to remove partial dependency
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(255)
);
 Create OrderDetails2NF table with full composite key (OrderID, Product)
CREATE TABLE OrderDetails2NF (
    OrderID INT,
    Product VARCHAR(255),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID));

 Insert distinct orders and customers to Orders table
INSERT INTO Orders (OrderID, CustomerName)
SELECT DISTINCT OrderID, CustomerName
FROM OrderDetails;

 Insert product details into OrderDetails2NF table
INSERT INTO OrderDetails2NF (OrderID, Product, Quantity)
SELECT OrderID, Product, Quantity
FROM OrderDetails;

