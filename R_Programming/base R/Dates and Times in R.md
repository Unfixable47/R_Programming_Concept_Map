dates and times in R work using the  #**lubridate** package 

Date syntax's
		a date("2016-08-16")
		a time within a data ("20:11:59 UTC")
		and a date-time. This is a date plus a time( "2018-03-31 18:15:48 UTC")

To get the current date type: 
		today()
		#> [1] "2021-01-20"

to get the current date-time type: 
		now()
		#> [1] "2021-01-20 16:25:05 UTC"

to put the date in a none standard format do the following
this will return the date in yyyy-mm-dd format
		ymd("2021-01-20")
		#> [1] "2021-01-20"
		type myd and mm-yyyy-dd follows
		type dmy and dd-mm-yyyy follows
		you can do the same if add an _  to the function with "h", "m", "s"
		h == hours
		m == minutes 
		s == seconds

You can use the as_date() to convert date-time to just a date reducing the variables.