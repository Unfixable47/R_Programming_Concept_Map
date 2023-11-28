R is an old langauge and some thing that where useful 10, 20, years ago now get in  your way. Its is difficult to change base R without breaking existing code  most innovations occur in packages.

tibbles are diffferent than standard data frames.they usually put up the first 10 rows of a frame
library()  to call library
data() and input diamonds
View(diamonds) to view the data set

as_tibbles() indicates what data you'd like to use in the parentheses of the function in this case use ***diamonds***

Tibble only returns the first 10 rows in a neatly organized table 
	you can explicly print() the data frame and control the number of rows (n) and the width of the disply.width = inf will display all columns:
```R
nycflight13::flight %>%
	print(n = 10, width = inf)
```
 you can also control default behavior in setting options
- option(tibble.print_max = n, tibble.print_min = m): of more than m rows, print only  n rows. Use options(dplyr.print_min =Inf) to always show all rows.
- Use options(tibble.width = Inf) to always print all columns, regardless of width screen. 


[[tidyverse]]
[[Operators]]


tibbles are one of the unifying features of the tidyverse:

you can use the following code to coerce a dataframe into a tibble
```R
as_tibble(iris)
```

Tibbles do not change inputs (never converts strings to factors) it never changes names of variables and it never creates Row names.
	this is useful for importing data from excel less cleaning to do in the long run less energy spent on time wasting taste (you've done it before)

tibbles work really well within the tidyverse, its better to use them instead of data frames, they are less complicated than data frames and are better for data analysis. they work really well with base R as well. Problems with datasets can be caught early when using tibbles. 

```R
tribble()
```
is a customized for data entry in code: column headings are defined by formulas (the start with ~) and entries are separated  by commas This makes it possible to lay out small amounts of data in easy to read forms

