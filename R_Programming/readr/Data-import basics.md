Rstudio has preloaded data sets you can practice with. This will be good practice for the future.

data() function to load the data sets you want. 


##***readr package***
you can also import data using readr packages, which is a great tool for reading rectangualar data.
		rectangular data: is data that fits nicely insdie of a rectangle of arows and columns, with each column referring to a single variabel and row reffereing to a single obervation. 
				read_csv()
				read_tsv()
				read_table()
				read_log()

readr_example()

output

[1] "challenge.csv"     "epa78.txt"         "example.log"      

[4] "fwf-sample.txt"    "massey-rating.txt" "mtcars.csv"       

[7] "mtcars.csv.bz2"    "mtcars.csv.zip"

read_csv(readr_example("mtcars.csv"))

it will print out a column specificatoin that gives the name and type of each column
R will also print a tibble


***Reading a .csv file with readxl***

use the read-excel( ) function to read a spreadsheet file just like you used read_csv( ) funct ion to read a .csv file. The code for reading the example file "type-me.xlsx" includes the path to the file in the parenteses function.
read_excel(readxl_example("type-me.xlsx"))


excel_sheets(readxl_example("type-me.xlsx"))

[1] "logical_coercion" "numeric_coercion" "date_coercion" "text_coercion"

you can also specify a sheet by a name or number, Just type "sheet = " followed by the name or number of the sheet. 

read_excel(readxl_example("type-me.xlsx"), sheet = "numeric_coercion")



