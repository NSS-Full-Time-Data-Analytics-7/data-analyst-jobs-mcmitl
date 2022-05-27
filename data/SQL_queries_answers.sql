/* 1. How many rows are in the data_analyst_jobs table? 
SELECT COUNT (*)
FROM data_analyst_jobs; */
--1793

/* 2. Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row? 
SELECT *
FROM data_analyst_jobs
LIMIT 10; */
--ExxonMobil

/* 3. How many postings are in Tennessee? How many are there in either Tennessee or Kentucky? 
SELECT COUNT (*)
FROM data_analyst_jobs
WHERE location = 'TN' OR location = 'KY'; */
--21, 27

/* 4. How many postings in Tennessee have a star rating above 4?
SELECT *
FROM data_analyst_jobs
WHERE location = 'TN'
AND star_rating > 4; */
--3

/* 5. How many postings in the dataset have a review count between 500 and 1000?
SELECT *
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 and 1000; */
--151

/* 6. Show the average star rating for companies in each state. The output should show the state as `state` and the average rating for the state as `avg_rating`. Which state shows the highest average rating? 
SELECT location AS "state", ROUND(AVG(star_rating), 2) AS "avg_rating"
FROM data_analyst_jobs
GROUP BY state
ORDER BY avg_rating DESC NULLS LAST; */
--NE,	4.20  Tip: nulls last to place all nulls at the end of list

/* 7. Select unique job titles from the data_analyst_jobs table. How many are there?
SELECT COUNT (DISTINCT title)
FROM data_analyst_jobs; */
--881 Note: distint has to be in parenthesis to work right with count

/* 8. How many unique job titles are there for California companies?
SELECT DISTINCT title, location
FROM data_analyst_jobs
WHERE location = 'CA'; */
--230

/* 9. Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations?
SELECT COUNT(DISTINCT company)
FROM data_analyst_jobs
WHERE review_count > 5000
AND company IS NOT NULL; */
--40

/* 10. Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating? 
SELECT company, AVG(star_rating)
FROM data_analyst_jobs
WHERE review_count > 5000
GROUP BY company
ORDER BY avg DESC; */
--General Motors,	4.1999998090000000

/* 11. Find all the job titles that contain the word ‘Analyst’. How many different job titles are there? 
SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs
WHERE title ILIKE '%Analyst%'; */
--774 NOTE: like is case sensitive, but ilike isn't

/* 12.How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common? 
SELECT title
FROM data_analyst_jobs
WHERE title NOT ILIKE '%Analyst%'
AND title NOT ILIKE '%Analytics%'; */
--4, Tableau

/* **BONUS:**
You want to understand which jobs requiring SQL are hard to fill. Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks. 
 - Disregard any postings where the domain is NULL. 
 - Order your results so that the domain with the greatest number of `hard to fill` jobs is at the top. 
  - Which three industries are in the top 4 on this list? How many jobs have been listed for more than 3 weeks for each of the top 4? */


SELECT COUNT(skill) AS total_jobs, domain, ROUND(AVG(days_since_posting), 2)
FROM data_analyst_jobs
WHERE domain IS NOT NULL
AND skill LIKE '%SQL%'
AND days_since_posting > 21
GROUP BY domain
ORDER BY total_jobs DESC;

--Total 403/ 1st 62 jobs "Internet and Software"
--2nd 61 jobs "Banks and Financial Services"
--3rd 57 jobs "Consulting and Business Services"
--4th 52 jobs "Health Care"


