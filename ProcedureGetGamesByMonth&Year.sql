USE VideoGamingHubDB; -- to ensure I'm using the correct database

DELIMITER // -- Define a delimiter to avoid conflicts with any semicolons in the procedure

-- Create a stored procedure to get game sales filtered by month and year

CREATE PROCEDURE GetGameSalesByMonthAndYear( 
    IN filterYear INT, 
    IN filterMonth INT 
)
BEGIN
  SELECT 
    G.Title, -- Select the game title
    DATE_FORMAT(P.PurchaseDate, '%Y-%m') AS SaleMonth, -- Format the purchase date to year-month
    SUM(P.Quantity) AS TotalSold -- Calculate the total quantity sold for each game in the specified month, name the column TotalSold
  FROM Purchases P 
  JOIN Games G ON P.GameID = G.GameID -- join Purchases with Games tables 
  WHERE 
    YEAR(P.PurchaseDate) = filterYear -- Filter by the specified year
    AND MONTH(P.PurchaseDate) = filterMonth  -- Filter by the specified month
  GROUP BY G.Title, SaleMonth -- Group by game title and sale month 
  ORDER BY G.Title, SaleMonth; -- Order the results by game title and sale month
END //

DELIMITER ; -- Reset the delimiter to default

-- Example usage: Get sales for May 2025
CALL GetGameSalesByMonthAndYear(2025, 5); 
-- This will return the sales data for games sold in May 2025