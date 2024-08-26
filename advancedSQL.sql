--1-- Write a SQL query to fetch the authors who don't have any books associated with them.
SELECT authorname FROM authors a LEFT JOIN books b ON a.authorid = b.authorid WHERE bookid IS NULL;

--2-- identify which customer have missed more than 4 sessions in a row
WITH SessionOrder AS (
    SELECT *, ROW_NUMBER () OVER (PARTITION BY userid ORDER BY sessiondate) AS row_num
    FROM WorkoutSessions
),
ConsecutiveSession AS (
    SELECT a.userid, 
        a.sessiondate AS current_date,
        b.sessiondate AS previous_date,
        a.iscompleted AS current_status,
        b.iscompleted AS previous_status
    FROM SessionOrder a 
    JOIN SessionOrder b 
    ON a.userid = b.userid
    AND a.row_num = b.row_num + 1 -- match the next day with previous date
    WHERE a.iscompleted >= b.iscompleted -- only match if the previous one is attended/ missed and the next one is missed
)

SELECT userid, COUNT(*) AS cons_sessions
FROM ConsecutiveSession
GROUP BY userid
HAVING COUNT(*) >=4
ORDER BY userid;

--3-- highest sales number each quarter: create a quarter column, ranking the total customer for each salesperson by quarter

WITH Quarter AS(
    SELECT *, 
    CONCAT(EXTRACT(QUARTER FROM SaleDate),'-',EXTRACT(YEAR FROM SaleDate)) AS Quarter
    FROM sales
),

Ranking AS (
    SELECT salespersonid, COUNT(customerid), quarter, RANK() OVER (PARTITION BY quarter ORDER BY COUNT(customerid) DESC) 
    FROM Quarter GROUP BY salespersonid, quarter ORDER BY quarter DESC, COUNT(customerid) DESC
)
SELECT salespersonid, quarter, rank FROM Ranking WHERE rank = 1 ORDER BY salespersonid ASC;


--4-- Find top 5 website has highest increase in visit M-o-M
WITH total_visits AS(
    SELECT pageid, DATE_TRUNC('month',visitdate) AS month, SUM(visits) AS visits
    FROM websitetraffic GROUP BY pageid, month ORDER BY pageid, month DESC
),
monthgrowth AS(
    SELECT pageid, month, visits, ROUND(visits*100/(LEAD(visits) OVER (PARTITION BY pageid ORDER BY month DESC)),2) AS growth
    FROM total_visits ORDER BY month DESC
),
ranking AS(
    SELECT pageid, month, visits, growth, RANK() OVER (PARTITION BY month ORDER BY growth DESC) AS rank
    FROM monthgrowth ORDER BY month DESC
)
SELECT pageid, month, visits, growth, rank FROM ranking
WHERE rank <=5 AND growth IS NOT NULL ORDER BY month DESC, rank ASC;


--5-- which customer have overdue rental but not yet return
SELECT rentalid, customerid, rentaldate, duedate FROM rentals
WHERE returndate IS NULL AND duedate < CURRENT_DATE;


--6-- exam with highest failure rate (register but not passed)
SELECT examid, COUNT(studentid) FROM onlineexams WHERE completiondate IS NULL 
GROUP BY examid ORDER BY COUNT(studentid) DESC LIMIT 1;

--7-- identify customers whose rating has been declining for the past 3 consecutive reviews

WITH previousscore AS(
    SELECT *, 
    LAG(rating,1) OVER (PARTITION BY customerID ORDER BY reviewdate) AS previous1,
    LAG(rating,2) OVER (PARTITION BY customerID ORDER BY reviewdate) AS previous2
    FROM CustomerReviews
)

SELECT customerID, rating FROM previousscore WHERE rating < previous1 AND previous1 < previous2;

--8-- find the articles that did not received any like within 2 weeks from publishing date
-- case1: the article already got the like 

SELECT title, l.articleid, (MIN(likedate) - publishdate) AS dategap
FROM Articles a JOIN Likes l ON a.ArticleID = l.ArticleID
GROUP BY l.articleid, a.title, publishdate HAVING (MIN(likedate) - publishdate) >=14

UNION ALL

-- case2: the article have not got any like till today

SELECT title, a.articleid, (CURRENT_DATE - publishdate) AS dategap
FROM Articles a LEFT JOIN Likes l ON a.ArticleID = l.ArticleID
GROUP BY a.articleid, a.title, publishdate,l.articleid HAVING (CURRENT_DATE - publishdate) >=14 AND l.articleid IS NULL;

--9-- count the number of active memberships on the last day of each month in the past year
-- member that has join date before the end of the month and expirationdate after end of the month
-- create a table with the last date of each month over the last year

WITH LastDays AS (
    SELECT (DATE_TRUNC('month', CURRENT_DATE) - INTERVAL '1 day')::date AS last_day
    UNION ALL
    SELECT (DATE_TRUNC('month', CURRENT_DATE) - INTERVAL '1 month' * n)::date - INTERVAL '1 day'
    FROM generate_series(1, 11) AS s(n)
)
SELECT last_day,COUNT(*) AS active_memberships
FROM LastDays
JOIN Membership m ON m.JoinDate <= last_day 
    AND (m.ExpirationDate IS NULL OR m.ExpirationDate >= last_day)
GROUP BY last_day
ORDER BY last_day;

--10-- find the least visited exhibits in the last winter
WITH wintervisit AS (
    SELECT *,
        CASE
            WHEN '1/10/2023' <= visitdate THEN 'winter'
            ELSE 'Not winter'
        END AS winter
    FROM museumvisits
)
SELECT exhibitname, COUNT (*)
FROM wintervisit WHERE winter = 'winter' GROUP BY exhibitid, exhibitname ORDER BY COUNT(*) LIMIT 1;

--11-- find manufacturers whose products, on average, have sold more than 50,000 units, but have fewer than 5 products listed.
SELECT manufacturerid, manufacturername FROM Manufacturers
WHERE manufacturerid IN (SELECT manufacturerID FROM products GROUP BY manufacturerid HAVING SUM(unitssold) >= 50000);

--12-- determine which hotel location has seen a consistent month-on-month increase in bookings over the last year
WITH monthly_visits AS (
    SELECT hotellocation, DATE_TRUNC('month',checkindate) AS month, COUNT(*) AS bookings
    FROM hotelbookings 
    GROUP BY hotellocation, month 
    ORDER BY hotellocation, month DESC
),
monthgrowth AS (
    SELECT 
        hotellocation, 
        month, 
        bookings, 
        ROUND(bookings*100/(LEAD(bookings) OVER (PARTITION BY hotellocation ORDER BY month DESC)),2) AS growth
    FROM monthly_visits 
    ORDER BY hotellocation,month DESC
),
previous AS (
    SELECT 
        *, 
        LEAD(growth) OVER (PARTITION BY hotellocation ORDER BY month DESC) AS previous_rate
    FROM monthgrowth
)
SELECT * FROM previous WHERE previous_rate IS NOT NULL AND previous_rate > growth;

--13-- calculate the 7-day moving average of daily visits for each date
SELECT 
    visit_date, 
    SUM(visit_count) OVER (ORDER BY visit_date ROWS BETWEEN 6 PRECEDING
                            AND CURRENT ROW) AS Rolling_7day_visits
FROM daily_visits;

--14-- Given a table 'stock_prices' with columns (date, stock_symbol, closing_price). 
--What's the cumulative change in stock price compared to the starting price of the year

WITH first_day_price AS (
    SELECT stock_symbol, closing_price, date
    FROM stock_prices 
    WHERE date IN (SELECT MIN(date) FROM stock_prices GROUP BY stock_symbol)
    AND DATE_TRUNC('year',date) = DATE_TRUNC('year', CURRENT_DATE)
)

SELECT 
    sp.stock_symbol,
    SUM(sp.closing_price - fdp.closing_price) AS Cummulative_change
FROM stock_prices sp 
JOIN first_day_price fdp ON sp.stock_symbol = fdp.stock_symbol
AND DATE_TRUNC('year',sp.date) = DATE_TRUNC('year', fdp.date)
GROUP BY sp.stock_symbol
ORDER BY sp.stock_symbol;

--15-- the price difference between each product and the next most expensive product in that category
SELECT * FROM cat_products

SELECT 
    product_id,
    product_name,
    category_id,
    price,
    (LEAD(price) OVER (PARTITION BY category_id ORDER BY price ASC) - price) AS price_diff
FROM cat_products

--16-- divide customers into 10 deciles based on their total spending
WITH CTE AS (
SELECT 
    customer_id, 
    total_spend, 
    NTILE(10) OVER (ORDER BY total_spend ASC) AS Buckets
FROM customer_spending
)

SELECT Buckets, MIN(total_spend), MAX(total_spend), COUNT(*) AS Bucket_size
FROM CTE 
GROUP BY buckets ORDER BY buckets

--17-- calculate the day-over-day change in user count and the growth rate

SELECT 
    activity_date,
    user_count,
    (user_count - LAG(user_count) OVER (ORDER BY activity_date ASC)) AS previous_user_count_diff,
    (user_count - LAG(user_count) OVER (ORDER BY activity_date ASC))*100/user_count AS growth_rate
FROM daily_active_users
ORDER BY activity_date;

--18--  calculate the total sales amount for each day of the current month, 
-- along with a running total of month-to-date sales

WITH CTE AS (
SELECT 
    sale_date, 
    SUM(amount) AS daily_sales
FROM sales_mtd 
GROUP BY sale_date 
ORDER BY sale_date
)
SELECT 
    sale_date,
    daily_sales,
    SUM(daily_sales) OVER (PARTITION BY DATE_TRUNC('month',sale_date) 
                        ORDER BY sale_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS mtd_sales
FROM CTE

--19-- identify the top 5 employees by sales amount in each department

WITH ranking AS (
    SELECT 
        es.employee_id,
        e.employee_name,
        es.department_id,
        SUM(es.sales_amount) AS total_sales,
        RANK() OVER (PARTITION BY department_id ORDER BY SUM(es.sales_amount)) AS e_rank
    FROM employee_sales es
    JOIN employees e ON es.employee_id = e.employee_id
    GROUP BY es.employee_id, e.employee_name, es.department_id
)

SELECT employee_id, employee_name, department_id, total_sales, e_rank
FROM ranking
WHERE e_rank <=5
ORDER BY department_id

--20-- find employees who have been promoted (i.e., changed to a different position) within 6 months of their initial hire

WITH CTE AS (
SELECT
    employee_id,
    start_date,
    position,
    LEAD(start_date) OVER (PARTITION BY employee_id ORDER BY start_date) AS next_promoted_day,
    LEAD(position) OVER (PARTITION BY employee_id ORDER BY start_date) AS next_promoted_position,
    ROW_NUMBER() OVER (PARTITION BY employee_id ORDER BY start_date) AS time_promoted
FROM employee_positions
)
SELECT employee_id, start_date, position, next_promoted_day, next_promoted_position, next_promoted_day - start_date
FROM CTE 
WHERE (next_promoted_day - start_date)/30::numeric <= 6
AND time_promoted = 1;

--21-- calculate the moving average of transaction amounts for each customer over their last 3 transactions, 
-- but only for customers who have been signed up for more than a year

SELECT 
    ct.customer_id, 
    transaction_date, 
    ci.customer_name,
    ci.signup_date,
    AVG(transaction_amount) OVER (PARTITION BY ct.customer_id 
                                    ORDER BY transaction_date ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS moving_avg_3transactions
FROM customer_transactions ct
JOIN customer_info ci ON ct.customer_id = ci.customer_id
WHERE (CURRENT_DATE - signup_date)/365 >= 1
