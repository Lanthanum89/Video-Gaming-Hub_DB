-- procedure to get the top selling games 


USE VideoGamingHubDB; -- to ensure I'm using the correct database

DELIMITER // -- Define a delimiter to avoid conflicts with any semicolons in the procedure

CREATE PROCEDURE GetTopGames(IN num INT) 

BEGIN 
  SELECT G.Title, SUM(P.Quantity) AS TotalSold -- Select game title and total quantity sold
  FROM Purchases P -- Join Purchases with Games to get game details
  JOIN Games G ON P.GameID = G.GameID -- Join on GameID
  GROUP BY P.GameID 
  HAVING SUM(P.Quantity) > 0 -- Ensure only games with sales are included
  ORDER BY TotalSold DESC -- Order by total quantity sold in descending order
  LIMIT num; -- Limit the results to the specified number of top games
END //  -- End the procedure

DELIMITER ; -- resets the delimiter to default (a semicolon)

-- to run stored procedure to get the top 5 selling games:
CALL GetTopGames(5);
