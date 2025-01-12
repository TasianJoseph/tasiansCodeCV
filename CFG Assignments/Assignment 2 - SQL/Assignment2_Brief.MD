Question 1 (52 marks)
Design and implement a database that solves a specific problem as per your chosen theme.
 Remember to come up with a unique creative problem or scenario and show real-life expected use of your database!
Marks:
A. Designing and creating a database in SQL (16 marks)
B. Using, querying, and updating databases in SQL (25 marks) C. Code readability, layout, and use of best practices
(6 marks) D. Creativity (5 marks)
You should:
+ Create a database with at least 3 tables with several columns, use good naming
conventions
+ Link tables using primary and foreign keys effectively
+ Populate the database with at least 8 rows of mock data per table to show use of DML
commands. The data does not need to be real or accurate.
+ Keep in your code all commands you used to set up your database, tables, and all demo
queries. You can comment out queries you do not want to be auto run
+ Use at least 3 different data types while creating tables
+ Use at least 2 constraints while creating tables, not including primary key or foreign key
+ Use at least 3 queries to insert data
+ Use at least 5 queries to retrieve data
+ Use at least 1 query to delete data
+ Use at least 2 aggregate functions
+ Use at least 2 joins
+ Use at least 2 additional in-built functions (to the two aggregate functions already
counted in previous point)
+ Use data sorting for majority of queries with ORDER BY
+ Create and use one stored procedure or function to achieve a goal
+ Normalise the DB by splitting the data out in tables where appropriate and not
containing any duplicate data.
+ Provide a creative scenario of use
If you cannot come up with a creative idea you can use this scenario, but 5 points out of the total mark are for
creativity and you will receive 0 for creativity:

"I want to help my local coffee shop to store their stock level and loyalty program members.
To do this I will store drinks (id, name, price, calories, sizes, ingredients, allergens),
food (id, names, prices, calories, allergens, quantity), remaining_stock(id, name, item_count)
for quantifying things like milk, tea bags, sugar, napkins and more to keep the business running and with a stored
procedure that alerts if some item is low in stock by having stored min values for each item,
members (name, lastn_ame, email, phone_number, membershi_id, points_collected) and their
purchases(item_id, quantity, total, date) in another table.
I will write queries to add, or delete items for the purchases table, I will write queries that decrease stock
when a purchase is made, and I will write queries to increase stock when we have a new delivery.
I will use aggregate functions to show statistics like all teas left counting together different tea types and similar.
I will connect tables with ID as the primary key and link members to purchases and purchases to stock and to drinks or
food tables. If I have time I will split out allergens in a separate table. I will have membership_id to be
AUTOINCREMENT, I will use varchar with various amounts for text data like item names, and int for the stock count, 
I will use float for prices, and I will enforce NOT NULL

where appropriate. I will use the date in-built functions to record purchase times for our loyalty program members. 
This will be explained and I will add a scenario where I will run all commands for someone coming in, ordering something 
with membership and without and how that impacts stock. 
I will also simulate making a mistake in the order and undoing it.”