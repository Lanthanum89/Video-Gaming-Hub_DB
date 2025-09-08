USE VideoGamingHubDB; -- ensure I'm using the correct database

INSERT INTO Purchases (CustomerID, GameID, PurchaseDate, Quantity) values -- inserting data into purchases table
('5', '9', '2025-03-20', '1'),
('6', '10', '2025-04-21', '2'),
('7', '11', '2025-01-22', '1'),
('8', '12', '2025-02-23', '1'),
('5', '1', '2025-03-24', '2'),
('6', '2', '2025-03-25', '1'),
('7', '3', '2025-05-26', '1'),
('8', '4', '2026-06-27', '3');

SELECT * FROM Purchases; -- to check the inserted data has been added correctly

DELETE FROM Purchases -- example of deleting data from Purchases table
WHERE PurchaseDate > CURRENT_DATE; -- to delete data where a purchase has incorrectly been entered as a date in the future, such as the last line of INSERT INTO 

-- need to turn off safe update mode 
SET SQL_SAFE_UPDATES = 0; -- to allow deletion of rows without a WHERE clause

SELECT * FROM purchases; -- to check the data after deletion

-- rollback; -- if need to revert changes