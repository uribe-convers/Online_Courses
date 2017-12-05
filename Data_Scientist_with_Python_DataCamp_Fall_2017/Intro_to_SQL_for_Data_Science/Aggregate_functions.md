# Aggregate functions, arithmetic, AS clause

Aggregate functions allow you to perform some calculations on the data in a 
database. Some of these are `SUM`, `AVG`, `MAX`, `MIN`.

```SQL
SELECT AVG(budget)
FROM films;

SELECT MAX(budget)
FROM films;

SELECT SUM(budget)
FROM films;

SELECT MIN(budget)
FROM films;
````
Aggregate functions can be combined with the WHERE clause to gain further 
insights from your data.

For example, to get the total budget of movies made in the year 2010 or later:

```SQL
SELECT SUM(budget)
FROM films
WHERE release_year >= 2010;

-- Get the average amount grossed by all films whose titles start with the 
-- letter 'A'.
SELECT AVG(gross)
FROM films
WHERE title LIKE 'A%'

-- Best movie between 2000 and 2012
SELECT MAX(gross)
FROM films
WHERE release_year BETWEEN 2000 AND 2012
```
In addition to aggregate functions, you can do basic arithmetic with `+`, `-`, 
`*`, and `/`. Keep in mind that when dividing an integer, SQL will return an 
integer as well, so `4 / 3` equals to `1`! For more accuracy, add decimal points
and the `AS result` clause at the end.

```SQL
SELECT (4 * 3)

SELECT (4 / 3)

SELECT (4.0 / 3.0) AS result
```

# The AS clause

When you extract a column with a function, the results are named based on the 
function name, so if you do `MAX` the results will be called `max`. However, if
you are performing two functions (two `MAX`) the results would be hard to 
interpret. You can specify a name for the results using the `AS` clause.

```SQL
SELECT MAX(budget) AS max_budget,
       MAX(duration) AS max_duration
FROM films;

/* Get the title and net profit (the amount a film grossed, minus its
budget) for all films. Alias the net profit as net_profit.*/
SELECT title, (gross - budget) AS net_profit
FROM films

/*Get the title and duration in hours for all films. The duration is in
 minutes, so you'll need to divide by 60.0 to get the duration in hours.
 Alias the duration in hours as duration_hours.*/
 SELECT title, (duration / 60.0) AS duration_hours
 FROM films



```
