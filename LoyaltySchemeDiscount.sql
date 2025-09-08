-- query to find customers with loyalty points over 4000 and their discounted game prices
USE videogaminghubdb; 

SELECT 
  C.FirstName, 
  C.LastName, 
  G.Title, 
  G.Price, 
  C.LoyaltyPoints,
  CASE 
    WHEN C.LoyaltyPoints > 4000 THEN G.Price * 0.9 -- Apply a 10% discount if loyalty points are over 4000
    ELSE G.Price -- No discount if loyalty points are 4000 or less
  END AS DiscountedPrice
FROM Customers C
JOIN Purchases P ON C.CustomerID = P.CustomerID -- Join Customers with Purchases to get customer details
JOIN Games G ON P.GameID = G.GameID -- Join Purchases with Games to get game details
WHERE C.LoyaltyPoints > 4000; -- Filter customers with loyalty points over 4000


-- a stored procedure to get the same result: (better because it can be reused with different parameters)
USE videogaminghubdb; 
DELIMITER //
CREATE PROCEDURE GetLoyaltyDiscount(IN minPoints INT)
BEGIN
  SELECT
    C.FirstName,
    C.LastName,
    G.Title,
    G.Price,
    C.LoyaltyPoints,
    G.Price * (1 - 0.1 * (C.LoyaltyPoints > minPoints)) AS DiscountedPrice
  FROM Customers C
  JOIN Purchases P ON C.CustomerID = P.CustomerID
  JOIN Games G ON P.GameID = G.GameID
  WHERE C.LoyaltyPoints > minPoints;
END //
DELIMITER ;

CALL GetLoyaltyDiscount(4000);
-- call the procedure and find customers with loyalty points over 4000 to get their discounted prices 