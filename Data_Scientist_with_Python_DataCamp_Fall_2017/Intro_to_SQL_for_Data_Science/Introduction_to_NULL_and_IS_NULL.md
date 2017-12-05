# Introduction to NULL and IS NULL

In SQL, `NULL` represents a missing or unknown value. You can check for `NULL`
values using the expression `IS NULL`. For example, to count the number of 
missing birth dates in the `people` table:

```SQL
SELECT name
FROM people
WHERE birthdate IS NOT NULL

```
To get the number of films which don't have a language associated with them.

```SQL
SELECT COUNT(*)
FROM films
WHERE language IS NULL
```

# LIKE and NOT LIKE

Sometimes you want to filter fields by matching patterns and not by a specific string or value. You can do this with the `LIKE` operator and the wildcards `%` and `_`, where `%` matches zero or many characters and the `_` will match only one.  
Similarly, the `NOT LIKE` operator finds records that don't match the pattern.

The code below will return 'Data', 'DataC' 'DataCamp', 'DataMind', etc.

```SQL
SELECT name
FROM companies
WHERE name LIKE 'Data%';

```
