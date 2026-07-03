WITH T AS
(
    SELECT
        C.CategoryName,
        SUM(O.Revenue) AS Total_Revenue,
        SUM(O.Revenue - O.Cost) AS Total_Profit
    FROM Orders O
    JOIN Products$ P
        ON O.ProductID = P.ProductID
    JOIN Category$ C
        ON P.CategoryID = C.CategoryID
    GROUP BY C.CategoryName
)

SELECT *
FROM T
ORDER BY Total_Revenue DESC, Total_Profit ASC;