# Advanced SQL practice

## About
This is a mini projects to practice writing advanced SQL queries for some popular good questions I collected through various source. 
With the help of ChatGPT, I have created dummy database for the practice.

- All the dummy database I created: [create database.sql](https://github.com/tamlai-portfolio/Advanced-SQL-practice/blob/main/create%20database.sql)
- SQL answers to all the questions below: [advancedSQL.sql](https://github.com/tamlai-portfolio/Advanced-SQL-practice/blob/main/advancedSQL.sql)

## Questions

1. table named "Books" with columns: BookID, Title, AuthorID. There's another table "Authors" with columns: AuthorID, AuthorName. 
Write a SQL query to fetch the authors who don't have any books associated with them. 

*** 2. You are given a table named "WorkoutSessions" with columns: UserID, SessionDate, IsCompleted (a boolean where 1 indicates completion and 0 indicates non-completion). 
Write a SQL query to identify users who have missed more than 5 consecutive workout sessions.

3. Consider a table named "Sales" with columns: SalespersonID, CustomerID, SaleDate. 
Write a SQL query to calculate the salesperson who made the highest number of sales each quarter.

4. You have a table named "WebsiteTraffic" with columns: PageID, VisitDate, Visits. 
Write a SQL query to find the top 5 pages that have shown the most significant increase in visits month-over-month.

5. You are provided with a table named "Rentals" with columns: RentalID, CustomerID, RentalDate, DueDate, ReturnDate. 
Write a SQL query to find out which rentals are currently overdue without being returned.

6. Consider a table named "OnlineExams" with columns: ExamID, StudentID, EnrollmentDate, CompletionDate. 
Write a SQL query to determine the exams with the highest failure rate (i.e., students enrolling but not passing).

7. You have a table named "CustomerReviews" with columns: CustomerID, ReviewDate, Rating (from 1 to 5). 
Write a SQL query to identify customers whose rating has been declining for the past 3 consecutive reviews.

8. There are two tables: "Articles" and "Likes". The "Articles" table has columns: ArticleID, Title, PublishDate, AuthorID. 
The "Likes" table has columns: LikeID, ArticleID, LikeDate. 
Write a SQL query to fetch the articles that have not received any likes within two weeks of their publishing date.

*** 9. You are given a table named "Membership" with columns: MemberID, JoinDate, ExpirationDate. 
Write a SQL query to count the number of active memberships on the last day of each month in the past year.

10. Consider a table named "MuseumVisits" with columns: ExhibitID, ExhibitName, VisitorID, VisitDate. 
Write a SQL query to find the least visited exhibits in the last winter.

11. There are two tables: "Products" and "Manufacturers". The "Products" table has columns: ProductID, ProductName, ManufacturerID, UnitsSold. 
The "Manufacturers" table has columns: ManufacturerID, ManufacturerName. 
Write a SQL query to find manufacturers whose products, on average, have sold more than 50,000 units, but have fewer than 5 products listed.

12. You have a table named "HotelBookings" with columns: BookingID, CheckInDate, GuestID, HotelLocation. 
Write a SQL query to determine which hotel location has seen a consistent month-on-month increase in bookings over the last year.

13. Given a table 'daily_visits' with columns (visit_date, visit_count), write a query to calculate the 7-day moving average of daily visits for each date.

14. Given a table 'stock_prices' with columns (date, stock_symbol, closing_price). What's the cumulative change in stock price compared to the starting price of the year?

15. You have two tables: 'products' with columns (product_id, product_name, category_id, price) and 'categories' with columns (category_id, category_name). 
What is the price difference between each product and the next most expensive product in that category?

16. Given a table 'customer_spending' with columns (customer_id, total_spend), how would you divide customers into 10 deciles based on their total spending?

17. Using a table 'daily_active_users' with columns (activity_date, user_count), write a query to calculate the day-over-day change in user count and the growth rate.

18. Given a table 'sales' with columns (sale_id, sale_date, amount), how would you calculate the total sales amount for each day of the current month, 
along with a running total of month-to-date sales?

19. You have two tables 'employee_sales' with columns (employee_id, department_id, sales_amount) and ‘employees’ with columns (employee_id, employee_name), 
write a query to identify the top 5 employees by sales amount in each department.

20.  Using a table 'employee_positions' with columns (employee_id, position, start_date, end_date), 
write a query to find employees who have been promoted (i.e., changed to a different position) within 6 months of their initial hire.

21. You have two tables: 'customer_transactions' with columns (customer_id, transaction_date, transaction_amount), 
and 'customer_info' with columns (customer_id, customer_name, signup_date). 
Write a query to calculate the moving average of transaction amounts for each customer over their last 3 transactions, 
but only for customers who have been signed up for more than a year
