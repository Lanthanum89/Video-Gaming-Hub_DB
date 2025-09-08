
# Video Gaming Hub Database

This project is a MySQL database for a fictional video game store, designed to manage platforms, customers, games, and purchase data. It includes example data, useful queries, and stored procedures for sales analysis and loyalty schemes.

## Features

- **Platforms Table:** Stores gaming platforms (PC, PlayStation, Xbox, Nintendo Switch).
- **Customers Table:** Stores customer details, including loyalty points and date of birth.
- **Games Table:** Stores game information, including genre, price, release date, platform, and age rating.
- **Purchases Table:** Tracks purchases made by customers, including quantity and date.
- **Loyalty Scheme:** Customers earn loyalty points and can receive discounts based on their points.
- **Age Verification:** Customer age can be checked against game age ratings.
- **Stored Procedures:**
  - `GetTopGames`: Returns the top N selling games.
  - `GetGameSalesByMonthAndYear`: Returns game sales filtered by month and year.
  - `GetLoyaltyDiscount`: Returns customers with loyalty points above a threshold and their discounted prices.
- **Example Queries:**
  - Total purchases per customer
  - Total sales per game
  - Games by platform and release date
  - Purchases in a specific month
  - Number of games per platform

## Files

- `VideoGamingHubDB.sql`: Main schema and data insertions.
- `5ExampleQueries.sql`: Example SQL queries for analysis.
- `ProcedureTop5Selling.sql`: Stored procedure for top selling games.
- `ProcedureGetGamesByMonth&Year.sql`: Stored procedure for sales by month/year.
- `LoyaltySchemeDiscount.sql`: Query and procedure for loyalty discounts.
- `Inserting&DeletingData.sql`: Examples of inserting and deleting data.
- `EER Diagram.png`: Entity-Relationship diagram of the database.

## Getting Started

1. **Create the Database:**
   - Run `VideoGamingHubDB.sql` in your MySQL environment to create the schema and insert sample data.

2. **Run Example Queries:**
   - Use the queries in `5ExampleQueries.sql` for data analysis.

3. **Use Stored Procedures:**
   - Run the procedure files to create stored procedures, then call them as needed (see comments in each file).

4. **Modify Data:**
   - Use `Inserting&DeletingData.sql` for examples of adding or removing data.

## Usage Examples

- Get the top 5 selling games:

  ```sql
  CALL GetTopGames(5);
  ```

- Get sales for May 2025:

  ```sql
  CALL GetGameSalesByMonthAndYear(2025, 5);
  ```

- Get loyalty discounts for customers with over 4000 points:

  ```sql
  CALL GetLoyaltyDiscount(4000);
  ```

## Notes

- The database can be expanded to include stock management and automatic updates on sales/returns.
- Age verification and loyalty schemes are included for demonstration and can be adapted for real-world use.

## License

This project is for educational purposes.
