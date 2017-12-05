# Introduction to SQL

The world's data is mostly stored in databases and those can be easily wrangled 
SQL, or _Structured Query Language_. This language is designed to work with the 
data in these **relational database**.

A relational database is a collection of tables, and each table will have rows 
and columns. Each row represents a **_record_** containing information for a single
entity. Each column, or **_field_**, of a table contains a single attribute for
all rows in the table.

One of the main purposes of SQL is to perform **queries**, or searches, on the 
database. You need to specify which column you want from which table. This is 
done with `SELECT` and `FROM`. These two terms are called **keywords**, and they
are _not_ cases sensitive, although by convention they are always in caps.

A simple query would look like:

```SQL
SELECT name
FROM authors
```

where `name` would be
the **field** (column) and `authors` would be the table. However, more often than not you'll need more than one column in the query. This can be done by separating the fields withs commas. 

```SQL
SELECT name, age
FROM authors
```

If you want to select all the columns you can use the wildcard `*` and even specify the number of results that are return with `LIMIT int`.

```SQL
SELECT *
FROM authors
LIMIT 10
```

There might be repeated values in the columns. To extract the unique ones,  you can use the `DISTINCT` keyword.

```SQL
SELECT DISTINCT languages
FROM books
```

Sometimes it's useful to know the number of records (rows) in a table. This can be done with the `COUNT` statement.

```SQL
SELECT COUNT(*)
FROM authors
```
This can be expanded to a single field **without missing data** (_non-missing values_), and to unique values.

```SQL
SELECT COUNT(DISTINCT birthdays)
FROM authors
```
