
## The purpose of this R script is to get you started on the
## midterm project. 

library(tidyverse)
library(magrittr)
library(readxl)


## Start by reading the data
strawb <- read_xlsx("strawberries-2022oct30-a.xlsx")

## Get the column names and index them
cnames <- colnames(strawb)
x <- 1:dim(strawb)[2]
x

## Explore data by viewing it in R.  
## Double click the strawb data frame to lauch the view() function.
## The data frame has 1008 rows, so you can't get very far by
## simply scrolling around.  But, you can generate some initial
## questions to help you explore using R functions from the
## tidyverse.  
##
## It looks like some of the columns may be blank or may contain 
## a single unique value.  These columns can be eliminated without 
## losing any information.

## Start by examining the content of the columns

## Column 1 contains two unique values.  
## Retain column 1 -- those values might be needed.
unique(strawb[1])
## Column 2 -- contains the years included in this dataset.
## Keep column 2, of course.
unique(strawb[2])

## Column 3 -- contains the time periods covered by in the dataset.
## There's only one -- years.  No info here.  Drop it
unique(strawb[3])

## you don't have to do this one column at a time.
## Note that the cells of columns that are empty contain NA, so
## the number of unique values in these columns is 1, just 
## like column_3.

## Set T as an indicator
T <- NULL

## Collect number of unique rows in each column
for(i in x){T <- c(T, dim(unique(strawb[i]))[1])}

## Use T to select columns to drop -- 
drop_cols <- cnames[which(T == 1)]
drop_cols
## Now, drop the columns with only one unique value.
strawb %<>% select(!all_of(drop_cols))

## Let's arrange the data frame by year and state.
strawb %<>% arrange(Year, State)


## Look at the strawb data frame again. You can see that the 
## columns need work. The State ANSI column contains a unique
## code for each state. If you need to access US Census data for
## the states, this code will come in handy.

colnames(strawb)

## now look at the `Data Item` column

temp1 <- strawb %>% select(`Data Item`) %>% 
  distinct()
temp1
## Look at temp1!  There's a lot going on there.
## In fact, it's at least three columns packed into one.
## Use separate() to split it up

## When you run this code you can see that there are 
## some rows where `Data Item` has 4 comma-separated 
## data items.  Look at the warning on the Console 
## after 

strawb2 <- strawb %>% separate(col=`Data Item`,
                into = c("Strawberries", "items", "units"),
                sep = ",",
                fill = "right")


## try 4 columns

strawb3 <- strawb %>% separate(col=`Data Item`,
            into = c("Strawberries", "type", "items", "units"),
                               sep = ",",
                               fill = "right")

## That worked. Clean up the dat.

rm(strawb2, strawb3)

strawb %<>% separate(col=`Data Item`,
                    into = c("Strawberries", "type", "items", "units"),
                    sep = ",",
                    fill = "right")

#Q1
ans_1<-100*285
ans_1
#Q2
m<-231304956
sd<- m*0.137
uper<-m+1.96*sd
lower<-m-1.96*sd
uper
lower
#Q3
#NA
#Q4

Select_Chemical <- filter(strawb,str_detect(`Domain Category`,"(CHEMICAL)|(FERTILIZER)"))

n_distinct(Select_Chemical$`Domain Category`)
#Q5
CF <- filter(strawb,str_detect(`Domain Category`,"(CHEMICAL)|(FERTILIZER)"), State=="FLORIDA")

CC <- filter(strawb,str_detect(`Domain Category`,"(CHEMICAL)|(FERTILIZER)"), State=="CALIFORNIA")

ans_5<-n_distinct(CC$`Domain Category`)-n_distinct(CF$`Domain Category`)

ans_5

