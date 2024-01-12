Range query is also one of the common types of data searching problems. The three most common types of ranges in SQL are 'IN",'BETWEEN','LIKE'

using the IN keyword makes SQL only compare the vlaue of the specified column absolutley precise, such as in the case, only records with an id equal to 1 or 3 will be fetched.

And just like the earlier example statement for 'IS NULL' you can add a 'NOT' keyword before 'IN' to obtain the opposite result 
	IN can be used for a diverese set of values 

Between is used for aggeragate functrions 
		`SELECT * FROM `new_schema`.`users` WHERE height BETWEEN 160 AND 190;
Like is used for text comparison
		`SELECT * FROM `new_schema`.`users` WHERE name LIKE 'J%';
