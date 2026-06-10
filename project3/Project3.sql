-- 1-Inquiry about best-selling and most profitable products
SELECT Product, 
       COUNT(OrderID) AS Total_Orders, 
       SUM(Quantity) AS Total_Quantity_Sold,
       ROUND(SUM(TotalPrice), 2) AS Total_Revenue
FROM Sales
GROUP BY Product
ORDER BY Total_Revenue DESC;


-- 2. Problem analysis query (cancelled and returned orders)
SELECT Product, OrderStatus, COUNT(OrderID) AS Number_of_Orders
FROM Sales
WHERE OrderStatus IN ('Cancelled', 'Returned')
GROUP BY Product, OrderStatus
ORDER BY Number_of_Orders DESC;


-- 3. Marketing Sources Performance Query
SELECT ReferralSource, 
       COUNT(OrderID) AS Total_Customers,
       ROUND(SUM(TotalPrice), 2) AS Total_Sales,
       ROUND(AVG(TotalPrice), 2) AS Average_Order_Value
FROM Sales
GROUP BY ReferralSource
ORDER BY Total_Sales DESC;


-- 4. Inquiry about customers' preferred payment methods
SELECT PaymentMethod, 
       COUNT(OrderID) AS Usage_Count,
       ROUND(SUM(TotalPrice), 2) AS Total_Amount_Processed
FROM Sales
GROUP BY PaymentMethod
ORDER BY Usage_Count DESC;


-- 5. VIP Customer Inquiry (Applying professional HAVING skills)
SELECT CustomerID, 
       ROUND(SUM(TotalPrice), 2) AS Customer_Lifetime_Value
FROM Sales
GROUP BY CustomerID
HAVING SUM(TotalPrice) > 3000
ORDER BY Customer_Lifetime_Value DESC;