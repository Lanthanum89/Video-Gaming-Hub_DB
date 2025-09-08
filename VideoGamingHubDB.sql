
-- For this assignment I have created a database for a fictional video games store. 
-- The database includes tables for different gaming platforms, customer data, the games the store have available for purchase, and data on purchases.

-- The database can be used to search for sales history by customer, game, month etc
	-- see 5 example queries file
    
-- I have constructed two stored procedures
	-- see two procedure files
    
-- this database includes data on a loyalty points, date of births, and game age ratings which could be used to:
	-- search for customers who have accrued a certain amount of loyalty points and offer them a discount as a reward and an incentive to spend more at the store
    -- verify the ages of customers when buying age restricted video games, checking the age of the customer against the ESRB (Entertainment Software Rating Board) ratings stored in the games table
    
-- the database could be expanded to hold stock information and update accordingly when sales are made or items returned







-- Video Gaming Hub Database -- 


CREATE DATABASE VideoGamingHubDB; -- Create the database
USE VideoGamingHubDB; -- Use the newly created database

-- Drop existing tables if they exist to avoid conflicts:
DROP TABLE IF EXISTS Purchases;
DROP TABLE IF EXISTS Games;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Platforms;

-- SCHEMA FOR VIDEO GAMING HUB DATABASE

-- 1. Platforms table - stores different gaming platforms (eg PC, PlayStation, Xbox, Nintendo Switch)
CREATE TABLE Platforms ( 
    PlatformID INT AUTO_INCREMENT PRIMARY KEY, -- primary key for the table, unique for each platform
    Name VARCHAR(50) NOT NULL UNIQUE --  must be unique, have a value (not null), and be less than 50 characters
);

-- 2. Customers table - table that stores customer information
CREATE TABLE Customers ( 
    FirstName VARCHAR(50), 
    LastName VARCHAR(50), 
    Email VARCHAR(100) UNIQUE, 
	CustomerID INT AUTO_INCREMENT PRIMARY KEY, -- primary key for the table, unique for each customer
    LoyaltyPoints INT DEFAULT 1000, --   Loyalty points for the customer, default is 1000 - customers receives 1000 points upon registration -- could be used to reward customers for purchases 
	DOB DATE NOT NULL --   Date of birth of the customer, cannot be null -- could be used to verify age for age-restricted games
);


-- 3. Games table - table that stores game information
CREATE TABLE Games ( 
    GameID INT AUTO_INCREMENT PRIMARY KEY, --   ID of game, primaru key for the table, unique for each game
    Title VARCHAR(100) NOT NULL, --   title of the game, must be unique and not null
    Genre VARCHAR(50), 
    Price DECIMAL(6,2), --   must be a non-negative value, up to 9999.99
    ReleaseDate DATE,    --   Release date of the game, can be blank if not yet released -- there is a check later on to make sure release date is not in the future, but could be added here (I wanted to use in my example of deleting data)
    PlatformID INT, --   Foreign key referencing the Platforms table
	AgeRating INT NOT NULL, --   Age rating of the game
    FOREIGN KEY (PlatformID) REFERENCES Platforms(PlatformID)  --   Foreign key referencing the Platforms table    
);

-- 4. Purchases table --   Table to store purchases made by customers
CREATE TABLE Purchases ( 
    PurchaseID INT AUTO_INCREMENT PRIMARY KEY, --   Unique identifier for each purchase, primary key for the table
    CustomerID INT, 
    GameID INT, 
    PurchaseDate DATE NOT NULL, 
    Quantity INT 
        CHECK (Quantity > 0), --   check to make sure quantity is a positive integer
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID), --   Foreign key referencing the Customers table
    FOREIGN KEY (GameID) REFERENCES Games(GameID) --   Foreign key referencing the Games table
);

-- Insert data into Platforms
INSERT INTO Platforms (Name) VALUES 
('PC'), ('PlayStation'), ('Xbox'), ('Nintendo Switch');

-- Insert data into Customers
INSERT INTO Customers (FirstName, LastName, Email, LoyaltyPoints, DOB) VALUES 
('Laura', 'Smith', 'laura.s@example.com', '1150', '1976-05-15'),
('Amelia', 'Barker', 'amelia.b@domain.com', '2340', '1988-08-22'),
('Jack', 'Summers', 'jack.s@email.com', '5681', '1992-11-30'),
('Freddie', 'Creese', 'freddie.c@example.com', '4751', '2001-02-10'),
('Oliver', 'Johnson', 'oliver.j@domain.com', '1025', '1995-04-05'),
('Sophia', 'Williams', 'sophia.w@email.com', '6110', '1989-11-28'),
('Liam', 'Brown', 'liam.b@example.com', '3365', '2003-07-25'),
('Emma', 'Jones', 'emma.j@email.com', '5214', '1991-01-25');


-- Insert data into Games
INSERT INTO Games (Title, Genre, Price, ReleaseDate, PlatformID, AgeRating) VALUES
('Legend of Pillars', 'RPG', '59.99', '2024-11-20', '1', '7'),
('Combat Blast', 'Shooter', '49.99', '2023-10-15', '2', '18'),
('Karting 2023', 'Racing', '39.99', '2023-08-30', '4', '3'),
('Chess 3D', 'Strategy', '29.99', '2022-07-22', '1', '3'),
('Mystic Forest', 'Adventure', '44.99', '2025-01-05', '3', '12'),
('Dungeon Depths', 'RPG', '54.99', '2024-09-14', '2', '15'),
('SpeedTrap 3000', 'Racing', '34.99', '2023-06-01', '4', '3'),
('Puzzle Mania', 'Puzzle', '19.99', '2022-03-03', '1', '3'),
('The Simulations', 'Simulation', '49.99', '2025-02-10', '3', '12'),
('Fantasy Quest', 'RPG', '59.99', '2024-12-01', '2', '15'),
('Action Heroes', 'Action', '44.99', '2023-11-15', '4', '15'),
('Space Odyssey', 'Sci-Fi', '39.99', '2025-03-20', '1', '7'),
('Mystery Mansion', 'Horror', '29.99', '2023-05-25', '3', '7');

-- Insert data into Purchases
INSERT INTO Purchases (CustomerID, GameID, PurchaseDate, Quantity) VALUES
('1', '1', '2025-05-10', '1'),
('2', '2', '2025-05-11', '1'),
('3', '3', '2025-05-12', '2'),
('4', '4', '2025-05-12', '1'),
('2', '5', '2025-05-14', '2'),
('1', '6', '2025-05-15', '1'),
('4', '7', '2025-05-16', '1'),
('3', '8', '2025-05-17', '3'),
('4', '1', '2025-05-18', '1'),
('1', '2', '2025-05-19', '2'),
('2', '6', '2025-05-15', '1'),
('3', '7', '2025-05-16', '1'),
('4', '8', '2025-05-17', '3');

