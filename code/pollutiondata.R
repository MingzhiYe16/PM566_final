library(data.table)
library(leaflet)
library(tidyverse)
library(lubridate)
library(httr)
library(data.table)
library(dplyr)
library(readr)
library(ggplot2)
library(tidytext)

dtafter <- data.table::fread("data/2018.csv")
dtbeforefire2017 <- data.table::fread("data/2017.csv")
dtbeforefire2016 <- data.table::fread("data/2016.csv")
dtbeforefire2015 <- data.table::fread("data/2015.csv")
dtbeforefire2014 <- data.table::fread("data/2014.csv")
dtbeforefire2013 <- data.table::fread("data/2013.csv")

dtafter <- dtafter[Date>="11/08" & Date<"11/26"]
dtbeforefire2017 <- dtbeforefire2017[Date>="11/08" & Date<"11/26"]
dtbeforefire2016 <- dtbeforefire2016[Date>="11/08" & Date<"11/26"]
dtbeforefire2015 <- dtbeforefire2015[Date>="11/08" & Date<"11/26"]
dtbeforefire2014 <- dtbeforefire2014[Date>="11/08" & Date<"11/26"]
dtbeforefire2013 <- dtbeforefire2013[Date>="11/08" & Date<"11/26"]


data1<-rbind(dtbeforefire2013,dtafter)
data1<-rbind(dtbeforefire2014,data1)
data1<-rbind(dtbeforefire2015,data1)
data1<-rbind(dtbeforefire2016,data1)
data1<-rbind(dtbeforefire2017,data1)


data_s<-data1[,concentration:=`Daily Max 1-hour SO2 Concentration`]
data_s<-data_s[,county:=COUNTY]
data_s<-data_s[,latitude:=SITE_LATITUDE]
data_s<-data_s[,longitude:=SITE_LONGITUDE]

summary(data_s$latitude)
summary(data_s$longitude)
summary(data_s$concentration)

data_s<-data_s[data_s$concentration>=0]

data_s<-data_s[,date:=substr(Date,1,5)]

data_s<-data_s[,year:=substr(Date,7,10)]

data_s_ori=data.table(data_s)

data_s<-data_s[year=="2013"|year=="2014"|year=="2015"|year=="2016"|year=="2017",year:="Previous years"]
















