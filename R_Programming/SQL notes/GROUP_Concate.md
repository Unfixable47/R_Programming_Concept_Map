![[Pasted image 20230211154459.png]]
steps for this problem
	we need to fetch the first letter and convert it to uppercase
	Secondly we need to fetch the remaning string to lowercase and then concat them

the four functions
	UPPER(A)
		where A is string
	LOWER(A)
		where A is string 
	SUBSTR(A,index,length)
		where A is string index is starting index(1 index instead of 0 index) and length which is optional 
			inorder to get the first letter we must use SUBSTR(name,1,1)
			To get the remaining string can use SUBSTRY(name,2)//length is not required here
		conact(A,B) where we conact two strings A+B

GROUP_CONCAT() function in MySQl is used to concatenate data from multipule rows into one field. this is aggregate(GROUP BY) function which returns a string value, if the group contains at least one non-NULL value otherwise it returns null 

the syntax is written as follows: 
```
SELECT col1, col2, ..., colN
GROUP_CONCAT ( [DISTINCT] col_name1 
[ORDER BY clause]  [SEPARATOR str_val] ) 
FROM table_name GROUP BY col_name2;
```
`col1,col2...., colN
	these are the columns names of the table. 
	``colname1:`` column of the table whos values are concatenated into a single field for each group.
``table_name:``  Name of table
`col_name2:`  Column of the table according to which grouping is done

Different clauses used inside GROUP_CONCAT() function
	Distinct: it elminates the repition of values from results
	Order By: it sorts the values of group in specific order and thne concatenates them
	Separator: By default the values of a group are separated by (,) operators. In order to change this separator value, Separator clause is used followed by a string literal. It is given as separator 'str_value'
		There is no need to use SEPARATOR in group_concat here.group_concat automatically does it for you.