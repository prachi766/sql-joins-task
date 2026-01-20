
--1. INNER JOIN: Orders with customer details
SELECT 
    c.CustomerId,
    c.FirstName,
    c.LastName,
    i.InvoiceId,
    i.InvoiceDate,
    i.Total
FROM Customer c
INNER JOIN Invoice i
ON c.CustomerId = i.CustomerId;

-- 2. LEFT JOIN: Customers who never placed any orders
SELECT 
    c.CustomerId,
    c.FirstName,
    c.LastName
FROM Customer c
LEFT JOIN Invoice i
ON c.CustomerId = i.CustomerId
WHERE i.InvoiceId IS NULL;

-- 3. Revenue per product (Track)
SELECT 
    t.Name AS Track_Name,
    SUM(il.UnitPrice * il.Quantity) AS Total_Revenue
FROM InvoiceLine il
INNER JOIN Track t
ON il.TrackId = t.TrackId
GROUP BY t.Name
ORDER BY Total_Revenue DESC;

-- 4. Category-wise revenue (Genre)
SELECT 
    g.Name AS Genre,
    SUM(il.UnitPrice * il.Quantity) AS Total_Revenue
FROM InvoiceLine il
INNER JOIN Track t
ON il.TrackId = t.TrackId
INNER JOIN Genre g
ON t.GenreId = g.GenreId
GROUP BY g.Name
ORDER BY Total_Revenue DESC;

-- 5. Business filter: Sales between dates
SELECT 
    c.FirstName,
    c.LastName,
    i.InvoiceDate,
    i.Total
FROM Customer c
INNER JOIN Invoice i
ON c.CustomerId = i.CustomerId
WHERE i.InvoiceDate BETWEEN '2012-01-01' AND '2013-01-01';