
library(tidyverse)
library(magrittr)
library(readxl)

strawb <- read_excel("C:/Users/HXP/Desktop/MA615/strawberries-2022oct30-a.xlsx")


cnames <- colnames(strawb)
x <- 1:dim(strawb)[2]

unique(strawb[1])

unique(strawb[2])

unique(strawb[3])

T <- NULL

for(i in x){T <- c(T, dim(unique(strawb[i]))[1])}

drop_cols <- cnames[which(T == 1)]
drop_cols

strawb %<>% select(!all_of(drop_cols))

strawb %<>% arrange(Year, State)

colnames(strawb)

temp1 <- strawb %>% select(`Data Item`) %>% 
  distinct()

strawb2 <- strawb %>% separate(col=`Data Item`,
                into = c("Strawberries", "items", "units"),
                sep = ",",
                fill = "right")

strawb3 <- strawb %>% separate(col=`Data Item`,
            into = c("Strawberries", "type", "items", "units"),
                               sep = ",",
                               fill = "right")


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


