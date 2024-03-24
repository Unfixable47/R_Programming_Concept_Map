loops is something you don't want to use in R, R is extremely memory heavy and with extremely large data sets loops can be rather slow.  I better option is map() from the purr package

```R 
library(readxl) dtest <- read_excel("C:\\Users\\richa\\Desktop\\SAE 2.06 programme-importé\\Jeu_de_do nnée_test.xlsm") 

summary(dtest) 

for (i in 2:(ncol(dtest)-1)) 
{ for (j in 2:(ncol(dtest)-1)) 
{ if (is.numeric(dtest[,i]) && is.numeric(dtest[,j])) 
{ corr <- cor(dtest[,i], 
			  dtest[,j]) 
 print(paste("Pour les colonnes", 
 names(dtest)[i], "et", 
  names(dtest)[j], 
  ", la valeur du coefficient de corrélation est", corr)) } } }

```

``` R 
library(readxl)
library(purrr)

# Read Excel file
dtest <- read_excel("C:\\Users\\richa\\Desktop\\SAE 2.06 programme-importé\\Jeu_de_donnée_test.xlsm")

# Print summary of the dataset
summary(dtest)

# Extract numeric columns
numeric_cols <- dtest %>%
  keep(is.numeric)

# Calculate correlation coefficients
cor_results <- map_dfr(1:(ncol(numeric_cols) - 1), ~ {
  map_dfr((.x + 1):ncol(numeric_cols), ~ {
    cor_val <- cor(numeric_cols[[.x]], numeric_cols[[.y]])
    data.frame(column1 = names(numeric_cols)[.x],
               column2 = names(numeric_cols)[.y],
               correlation = cor_val)
  })
})

# Print the correlation results
print(cor_results)
```