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


