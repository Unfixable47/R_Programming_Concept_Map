
#load the tidy verse 
library(tidyverse)

#set working directory
setwd("~/workbook/Ex_Files_Cleaning_Bad_Data_R/Exercise Files/5_5")

#load the data file
pew <- read_csv("pew.csv")

pew

pew.long <- gather(pew, income, freq, -religion)


pew.long