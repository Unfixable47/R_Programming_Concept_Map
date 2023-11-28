CData wrangling is not a one time task

why tidy data? 
	Facilitates inital exploration
	and analysis 
	Improves ability to collaborate with others
	Offers a standardized format to exchange data between tools

Tidy set have three elements
	Variables
		Measure some underlying attribute(height, duration, frequency, ect.)
	Observations
		are the collection of all measurements for variables related to a single entity 
	Values 
		reside at the intersection of variables and observations 

Tidy Data Rules 
1. Each Variable forms a column.
2. Each Observation forms a row.
3. Each type of observational unit forms a table.

Common Data Problems
1. Column heads are values, not variables names
2. Multiple variables are stored in one column.
3. Variables are stored in both rows and columns.
4. Multiple types of observationaal unites are in the same table
5. A single observational unit is in multpule table 

 Making Wide Datasets  Long with gather( )
	gather()
		makes wide data sets into long by gather the information from
		columns and putting it into rows
			Keys and Values
				Values
					the data value from a table that represents an observations of a single variable
				Key
					the name used to identify the variable described by the value
					(the key is usually the column name) 

gather(data, key, value, columns(s))
	you can list the columns you dont want to gather with a minus sign in front of them