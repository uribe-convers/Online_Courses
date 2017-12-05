# Filtering Results

For large databases you want to filter your results and extract the ones that
you are interested in. This is done with the `WHERE` keyword and a few comparison operators. **Importantly**, the `WHERE` clause comes always after the `FROM` keyword.

**_VERY IMPORTANT_**, for PostgresSQL you must use single quotes for strings!

The comparison operators are:

```
= equal
<> not equal
< less than
> greater than
<= less than or equal to
>= greater than or equal to
```

For example, the query for films that have a certain title or for the number of films over a budget of 10:

```SQL
SELECT title
FROM films
WHERE title = 'Metropolis'

---

SELECT COUNT(*)
FROM films
WHERE budget > 10
```

## Multiple Conditions
You can have multiple conditions while filtering the results. This is achieved with `AND`, `OR`, and `NOT`. The columns must be selected for each condition. For `AND` to work, all the conditions must be met. For `OR` to work only _one_ of them must be met.

```SQL
# Both conditions
SELECT title
FROM films
WHERE title = 'Metropolis'
AND language = 'English'

---

# Either of the conditions
SELECT title
FROM films
WHERE release_year = 2010
OR release_year = 2012
```
When combining `AND` and `OR`, be sure to enclose the individual clauses in parentheses, otherwise, due to SQL's precedence rules, you may not get the results you're expecting!

```SQL
SELECT title
FROM films
WHERE (release_year = 1994 OR release_year = 1995)
AND (certification = 'PG' OR certification = 'R')

---

SELECT title, release_year
FROM films
WHERE (release_year >= 1990 AND release_year <= 1999)
AND (language = 'French' OR language = 'Spanish')
AND (gross > 2000000)
```

## The Between keyword

Searching for values between two ranges is very common and that's why the `BETWEEN` keyword exists! _Importantly_, this keyword is **inclusive**, meaning the beginning and end values are included in the results!

```SQL
SELECT title
FROM films
WHERE release_year BETWEEN 1994 AND 2000
```
This clause can be combined with multiple `AND` and `OR` operators too.

```SQL
SELECT name
FROM kids
WHERE age BETWEEN 2 AND 12
AND nationality = 'USA';
```

## The IN operator

Having multiple `OR` conditions works but it requires to type a lot. Instead, use the `IN` operator to  specify multiple values in a `WHERE` clause.

```SQL
# Long with multiple `OR`
SELECT name
FROM kids
WHERE age = 2
OR age = 4
OR age = 6
OR age = 8
OR age = 10;

# Using the `IN` operator
SELECT name
FROM kids
WHERE age IN (2, 4, 6, 8, 10);

```
