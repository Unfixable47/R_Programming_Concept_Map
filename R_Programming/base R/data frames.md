
Data frame 
		a collection of column similar to a spread sheet or an excel spreedsheet 
	princpales
		columns should be named 
		data stored can be many different types, like numeric, factor, or character
		each column should contain the number of data items
			Tibbles
					never change the data types of the inputs.
					never change the name of your variables.
					They make printing in R easier, they won't overload all of R studio by loading in a entire spreadsheet only a single part of it. [[tibbles]]
			Tidydata
				reference to a principal that make data structures easier to understand a way of standarizing the way of orgnizing data within R studio 
						Variable are organized into columns 
						Obervations are organized into rows
						Each value must have its own cell

first look into data frams: 
	libray(ggplot2)
### type data to select an uploaded data set
	data(diamonds)
### heads only shows you the first 6 rows
	head(diamonds)
### str() shows in detail the sturucture of the data set
	str(diamonds)
### colnames grabs the column names of the data set
	colnames(diamonds)
### mutate adds columns to your data frame
	mutate(diamonds, carat_2=carat *100)
	means your going to add a new variable or write over and existing variable