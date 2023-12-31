
library(tidyverse)
library(RSQLite)
library(DBI)
library(ggplot2)
library(dplyr)


##library(ggpubr)
##library(broom222)

#set working directory
setwd("~/workbook")

#connect to the databade
con <- dbConnect(RSQLite::SQLite(),"Disaster_Data.db")

#list tables from the database 
dbListTables(con)
dbListFields(con,"us_disaster_declarations")

#test out this sql query
res<- dbSendQuery(con,
"SELECT fy_declared, 
count(incident_type) AS number_of_incidents 
FROM us_disaster_declarations
WHERE fy_declared > 1960
GROUP BY fy_declared
ORDER by fy_declared DESC;")

res<- dbGetQuery(con,
"SELECT fy_declared, 
count(incident_type) AS number_of_incidents 
FROM us_disaster_declarations
WHERE fy_declared > 1960
GROUP BY fy_declared
ORDER by fy_declared DESC;")

#build the data frames
disaster_df <- dbReadTable(con, "us_disaster_declarations")
type<- disaster_df %>% 
  count(incident_type)

#build summary stats from the data frames
summary(disaster_df)
colnames(disaster_df)
head(disaster_df)
View(disaster_df)

#rename  columns in the res data frames
res <- res %>% 
  rename(Number_of_Disasters_Declared = number_of_incidents,Year_Declared = fy_declared)

#arrange the order in a sequence this is a test for a later ggplot
type <- type %>% 
  arrange(n)

#take a look at the distribution of the graphs this this test for outliers
boxplot(res$Number_of_Disasters_Declared)
boxplot(type$n)

#filter out outliers
res <- res %>% 
  filter(Number_of_Disasters_Declared < 4500,Year_Declared < 2023)

#double check outliers with boxplot
boxplot(type$n)
boxplot(res$Number_of_Disasters_Declared)

View(res)

#build an arrangment paired with mutaute in DPLYR library than pass it to ggplot and build the graph
#this reorders the factors in the graph so its easier to break down and look at/
type %>% 
  arrange(n) %>% 
  mutate(incident_type=factor(incident_type,levels=incident_type)) %>% 
  ggplot(aes(x=incident_type,y=n))+
  geom_point(aes())+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))


hist(res$Number_of_Disasters_Declared)


#build a standard GGPLOT since this graph is on a timelines no need to do anything to it
res.graph <-ggplot(data = res,mapping = aes(x = Year_Declared,y=Number_of_Disasters_Declared))+
  geom_point(aes())+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  labs(title = "Number of Natural Disasters Declared by year",subtitle = 
         "By the federal government")

res.graph <- res.graph +geom_smooth(method = "lm",col="black")


cor(res$Year_Declared,res$Number_of_Disasters_Declared)
cor.test(res$Year_Declared,res$Number_of_Disasters_Declared)


#disconnect from the database
dbDisconnect(con)



