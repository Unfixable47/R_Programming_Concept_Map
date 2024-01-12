Main aggregate functions
	Count()
	Sum()
	AVG()
	MIN & MAX

Concacte combines to columns together
```
SELECT CONCAT(`id`, '-', `name`) AS `identification`, 
age 
FROM new_schema`.`users`;
```


the   `WHERE`  keyword only supports columns that already exist in this table

`having` helps developers filter the condition for combined columns which are written as follows; 


```
SELECT CONCAT(`id`, '-', `name`) AS `identification`, `age` FROM `new_schema`.`users`
HAVING `identification` LIKE '%J%';
```
the above snippet is an example of the having function being used iwth concat
		if you use `Having`  on large data sets the performence might be much slower 
		Having operates across rows, while WHERE operates at the row level.
		Having can reduce the number od results from a query by creating additional filtersd for the data to pass through
		WHEN using having make sure to check if you are using GROUP BY 
			The main difference is that the HAVING clause works on data after it has been grouped, and the WHERE clause works on data before it is grouped.
<>
	means not equal to
