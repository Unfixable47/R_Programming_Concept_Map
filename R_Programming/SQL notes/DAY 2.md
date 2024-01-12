CSELECT _column_name(s)_  
FROM _table_name_  
WHERE _condition_  in|(object,object.object)
GROUP BY _column_name(s)  
HAVING _condition  
ORDER BY _column_name(s);


==select employee_id,

if
		(==employee_id % 2 = 0 ==
		employee id: column 
		% represents zero or more charecters
		==OR name LIKE 'M%'==,
			under 'M%' is mean with M or more charecters in the string 
	0, 2
	salary) 
			IF(condition, value_if_true, value_if_false)

as bonus

==from Employees;==

UPDATE Salary

```
UPDATE salary 
SET 
	sex = CASE sex 
		WHEN 'm' 
		THEN 'f' 
		ELSE 'm'
	END;
```

update syntax need to contain the set in order to make the changes to the values in your table


```

select 
	employee_id , 
	case when employee_id%2 <>0 
	and name not like 'M%' 
	then salary else 0 end as bonus 
	from employees order by employee_id;
```