USE VideoGamingHubDB; 

-- Query 1: List all customers with their total number of purchases - would need to be limited for larger databases and filted with a condition
SELECT 
  C.FirstName, 
  C.LastName, 
  COUNT(P.PurchaseID) AS TotalPurchases -- Count the total number of purchases made by each customer
FROM Customers C 
LEFT JOIN Purchases P ON C.CustomerID = P.CustomerID -- join Customers with Purchases to get total purchases for each customer
GROUP BY C.CustomerID, C.FirstName, C.LastName; 

-- Query 2: List all games with their total sales - would need to be limited for larger databases and filted with a condition
SELECT 
  G.Title, 
  SUM(P.Quantity) AS TotalSold
FROM Games G
JOIN Purchases P ON G.GameID = P.GameID -- Join Games with Purchases to get total sales for each game
GROUP BY G.GameID, G.Title --
ORDER BY TotalSold DESC -- Order by total sales in descending order
LIMIT 50; -- Limit to top 50 games by total sales

-- Query 3: List all games with their platform, genre, and release date - would need to be limited for larger databases and filted with a condition
SELECT 
  G.Title, 
  G.Genre, 
  G.ReleaseDate,
  Pl.Name AS Platform 
FROM Games G
JOIN Platforms Pl ON G.PlatformID = Pl.PlatformID  -- Join Games with Platforms to get platform details
ORDER BY G.ReleaseDate DESC; -- Order by release date in descending order to show the most recent games first


-- Query 4: List all purchases made in May 2025 with customer details - an example of filtering purchases by date, to limit the amount of data returned. 
-- could be used to analyse sales trends or customer behaviour during a specific month, for research or marketing purposes.
SELECT 
  P.PurchaseID, 
  C.FirstName, 
  C.LastName, 
  G.Title, 
  P.PurchaseDate, 
  P.Quantity
FROM Purchases P
JOIN Customers C ON P.CustomerID = C.CustomerID -- Join Purchases with Customers to get customer details
JOIN Games G ON P.GameID = G.GameID -- Join Purchases with Games to get game details
WHERE YEAR(P.PurchaseDate) = 2025 AND MONTH(P.PurchaseDate) = 5; -- Filter purchases made in May 2025

-- Query 5: List all platforms and the number of games available on each -- could be used to analyse the distribution of games across different platforms, for markerting purposes. 
-- If one particular platform had hardly any sales perhaps stop stocking that platform and use the store space for more popular platforms.
SELECT 
  Pl.Name AS Platform, 
  COUNT(G.GameID) AS NumberOfGames -- Count the number of games available on each platform
FROM Platforms Pl
LEFT JOIN Games G ON Pl.PlatformID = G.PlatformID -- Join Platforms with Games to get the number of games for each platform
GROUP BY Pl.PlatformID, Pl.Name; -- Group by platform and name

-- Further queries could be added to analyse customer demographics, game ratings, or sales trends over time. 
