[Here](https://here.r-lib.org/): is for saving csv files 
[Skimr](https://www.rdocumentation.org/packages/skimr/versions/2.1.5): makes summarizing data really easy and lets skim through data 
[Janitor](https://www.rdocumentation.org/packages/janitor/versions/2.2.0): has functions for cleaning data
		(also use the packages with the dplr package )
		these packages simplify data cleaning task

 

skim_without_charts() gives a comprehensive summary of a data set. 
glimpse() shows a detailed data set
head() previews the
select() is useful for pulling a subset of variables from a large data set this lets you focus on specific sets of variables

rename() makes it easy to rename column names
rename_with() will make column names more consistant
		rename_with(penguins, tolower) 
				makes the colmn names all lower case 
clean_names(penguins)
		ensures only numbers letters and underscores in the names.
