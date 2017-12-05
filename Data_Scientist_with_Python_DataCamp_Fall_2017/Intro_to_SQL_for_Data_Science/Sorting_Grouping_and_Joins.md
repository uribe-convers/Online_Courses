# Order and Sort

## Single Columns
Now that you know how to select and filter data, it's important to sort and group
results. The `ORDER BY` keyword is used to sort results in ascending or descending
 order according to the values of one or more columns. The default is to sort in
 **ascending** order, but the keyword `DESC` can be used to sort in **descending**
 order. Use it after the `ORDER BY` clause.

```SQL
-- sort titles in films by release date, in descending order
SELECT title
FROM films
ORDER BY released_year DESC

/*Get all details for all films except those released in 2015 and order them 
by duration.*/
SELECT *
FROM films
WHERE release_year <> 2015
ORDER BY duration

-- Get the title and gross earnings for movies which begin with the letter 'M' 
-- and order the results alphabetically.
SELECT title, gross
FROM films
WHERE title LIKE 'M%'
ORDER BY title

/*Get the title and duration for every film, in order of longest duration to 
shortest.*/
SELECT title, duration
FROM films
ORDER BY duration DESC
```

## Sorting multiple columns

`ORDER BY` can also be used to sort on multiple columns. It will sort by the 
first column specified, then sort by the next, then the next, and so on. for
example, to sort by birthdate (from oldest to newest) and then by name 
(alphabetically), use:

```SQL
SELECT birthdate, name
FROM people
ORDER BY birthdate, name

-- Get the release year, duration, and title of films ordered by their release 
-- year and duration.
SELECT release_year, duration, title
FROM films
ORDER BY release_year, duration
```

# Grouping results

You often will need to aggregate results by some field and do some function on
only those records. This can be done easily with the `GROUP BY` keyword. For 
example, to count employees in a company and group them by gender:

```SQL
SELECT sex, count(*)
FROM employees
GROUP BY sex;

```

Commonly, `GROUP BY` is used with aggregate functions like `COUNT()` or `MAX()`.
Note that `GROUP BY` _always_ goes after the `FROM` clause!

**A word of warning:** SQL will return an error if you try to `SELECT` a field 
that is not in your `GROUP BY` clause without using it to calculate some kind 
of value about the entire group!

And of course, `GROUP BY` can be combine with `ORDER BY`, with `ORDER BY` _always_
after the `GROUP BY` keyword:

```SQL
SELECT sex, count(*)
FROM employees
GROUP BY sex
ORDER BY count DESC;

-- Get the release year and count of films released in each year.
SELECT release_year, COUNT(*)
FROM films
GROUP BY release_year

-- Get the release year and average duration of all films, grouped by release year.
SELECT release_year, AVG(duration)
FROM films
GROUP BY release_year

-- Get the language and total gross amount films in each language made.
SELECT language, SUM(gross)
FROM films
GROUP BY language

-- Get the release year, country, and highest budget spent making a film for 
-- each year, for each country. Sort your results by release year and country.
SELECT release_year, country, MAX(budget)
FROM films
GROUP BY release_year, country
ORDER BY release_year, country
```

# Filtering with Aggregate functions

Filtering fields when executing an aggregate function can't be done with the 
keyword `WHERE`, this results in an error. To accomplish this, you need to use
the keyword `HAVING` instead.

```SQL
-- shows only those years in which more than 10 films were released.
SELECT release_year
FROM films
GROUP BY release_year
HAVING COUNT(title) > 10
```

Now you're going to write a query that returns the average budget and average 
gross earnings for films in each year after 1990, if the average budget is 
greater than $60 million.

```SQL
SELECT release_year, AVG(budget) AS avg_budget, AVG(gross) AS avg_gross
FROM films
WHERE release_year > 1990
GROUP BY release_year
HAVING AVG(budget) > 60000000
ORDER BY avg_gross DESC
```
Get the country, average budget, and average gross take of countries that have 
made more than 10 films. Order the result by country name, and limit the number 
of results displayed to 5. You should alias the averages as avg_budget and 
avg_gross respectively.

```SQL
-- select country, average budget, average gross
SELECT country, AVG(budget) AS avg_budget, AVG(gross) AS avg_gross
-- from the films table
FROM films
-- group by country 
GROUP BY country
-- where the country has a title count greater than 10
HAVING COUNT(title) > 10
-- order by country
ORDER BY country
-- limit to only show 5 results
LIMIT 5

```

# Join

You will probably work with data distributed in multiple databases and it will
be necessary to combine data. This can be done with the `JOIN` keyword. For 
example, what if you want to see the IMDB score for a particular movie?
In this case, you'd want to get the ID of the movie from the `films` table and 
then use it to get IMDB information from the `reviews` table.

```SQL
SELECT title, imdb_score
FROM films
JOIN reviews
ON films.id = reviews.film_id
WHERE title = 'To Kill a Mockingbird';
```
