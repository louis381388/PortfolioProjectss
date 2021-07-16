#set working directory
setwd("~/r_folder/Retirement/bycounty")

#install packages
install.packages("tidyverse")
install.packages("skimr")
install.packages("janitor")

library(tidyverse)
library(skimr)
library(janitor)



Retirement_2010 <- read.csv("2010_County_Retirement.csv", header = TRUE)
Retirement_2011 <- read.csv("2011_County_Retirement.csv", header = TRUE)
Retirement_2012 <- read.csv("2012_County_Retirement.csv", header = TRUE)
Retirement_2013 <- read.csv("2013_County_Retirement.csv", header = TRUE)
Retirement_2014 <- read.csv("2014_County_Retirement.csv", header = TRUE)
Retirement_2015 <- read.csv("2015_County_Retirement.csv", header = TRUE)
Retirement_2016 <- read.csv("2016_County_Retirement.csv", header = TRUE)
Retirement_2017 <- read.csv("2017_County_Retirement.csv", header = TRUE)
Retirement_2018 <- read.csv("2018_County_Retirement.csv", header = TRUE)
Retirement_2019 <- read.csv("2019_County_Retirement.csv", header = TRUE)

#remove first row of bad data
Retirement_2010 <- Retirement_2010[-1,]
Retirement_2011 <- Retirement_2011[-1,]
Retirement_2012 <- Retirement_2012[-1,]
Retirement_2013 <- Retirement_2013[-1,]
Retirement_2014 <- Retirement_2014[-1,]
Retirement_2015 <- Retirement_2015[-1,]
Retirement_2016 <- Retirement_2016[-1,]
Retirement_2017 <- Retirement_2017[-1,]
Retirement_2018 <- Retirement_2018[-1,]
Retirement_2019 <- Retirement_2019[-1,]


#add year to data
for (i in Retirement_2010){
  Retirement_2010$Year[i]<- "2010"
}
for (i in Retirement_2011){
  Retirement_2011$Year[i]<- "2011"
}
for (i in Retirement_2012){
  Retirement_2012$Year[i]<- "2012"
}
for (i in Retirement_2013){
  Retirement_2013$Year[i]<- "2013"
}
for (i in Retirement_2014){
  Retirement_2014$Year[i]<- "2014"
}
for (i in Retirement_2015){
  Retirement_2015$Year[i]<- "2015"
}
for (i in Retirement_2016){
  Retirement_2016$Year[i]<- "2016"
}
for (i in Retirement_2017){
  Retirement_2017$Year[i]<- "2017"
}
for (i in Retirement_2018){
  Retirement_2018$Year[i]<- "2018"
}
for (i in Retirement_2019){
  Retirement_2019$Year[i]<- "2019"
}


#clean data
Retirement_2010 <- Retirement_2010%>%
  rename(Total = B19059_001E,
         Total_margin_of_error = B19059_001M,
         With_Retirement_income = B19059_002E,
         With_Retirement_margin_of_error = B19059_002M,
         Without_Retirement_income = B19059_003E,
         Without_Retirement_income_margin_of_error = B19059_003M)

Retirement_2011 <- Retirement_2011%>%
  rename(Total = B19059_001E,
         Total_margin_of_error = B19059_001M,
         With_Retirement_income = B19059_002E,
         With_Retirement_margin_of_error = B19059_002M,
         Without_Retirement_income = B19059_003E,
         Without_Retirement_income_margin_of_error = B19059_003M)

Retirement_2012 <- Retirement_2012%>%
  rename(Total = B19059_001E,
         Total_margin_of_error = B19059_001M,
         With_Retirement_income = B19059_002E,
         With_Retirement_margin_of_error = B19059_002M,
         Without_Retirement_income = B19059_003E,
         Without_Retirement_income_margin_of_error = B19059_003M)

Retirement_2013 <- Retirement_2013%>%
  rename(Total = B19059_001E,
         Total_margin_of_error = B19059_001M,
         With_Retirement_income = B19059_002E,
         With_Retirement_margin_of_error = B19059_002M,
         Without_Retirement_income = B19059_003E,
         Without_Retirement_income_margin_of_error = B19059_003M)

Retirement_2014 <- Retirement_2014%>%
  rename(Total = B19059_001E,
         Total_margin_of_error = B19059_001M,
         With_Retirement_income = B19059_002E,
         With_Retirement_margin_of_error = B19059_002M,
         Without_Retirement_income = B19059_003E,
         Without_Retirement_income_margin_of_error = B19059_003M)

Retirement_2015 <- Retirement_2015%>%
  rename(Total = B19059_001E,
         Total_margin_of_error = B19059_001M,
         With_Retirement_income = B19059_002E,
         With_Retirement_margin_of_error = B19059_002M,
         Without_Retirement_income = B19059_003E,
         Without_Retirement_income_margin_of_error = B19059_003M)

Retirement_2016 <- Retirement_2016%>%
  rename(Total = B19059_001E,
         Total_margin_of_error = B19059_001M,
         With_Retirement_income = B19059_002E,
         With_Retirement_margin_of_error = B19059_002M,
         Without_Retirement_income = B19059_003E,
         Without_Retirement_income_margin_of_error = B19059_003M)

Retirement_2017 <- Retirement_2017%>%
  rename(Total = B19059_001E,
         Total_margin_of_error = B19059_001M,
         With_Retirement_income = B19059_002E,
         With_Retirement_margin_of_error = B19059_002M,
         Without_Retirement_income = B19059_003E,
         Without_Retirement_income_margin_of_error = B19059_003M)

Retirement_2018 <- Retirement_2018%>%
  rename(Total = B19059_001E,
         Total_margin_of_error = B19059_001M,
         With_Retirement_income = B19059_002E,
         With_Retirement_margin_of_error = B19059_002M,
         Without_Retirement_income = B19059_003E,
         Without_Retirement_income_margin_of_error = B19059_003M)

Retirement_2019 <- Retirement_2019%>%
  rename(Total = B19059_001E,
         Total_margin_of_error = B19059_001M,
         With_Retirement_income = B19059_002E,
         With_Retirement_margin_of_error = B19059_002M,
         Without_Retirement_income = B19059_003E,
         Without_Retirement_income_margin_of_error = B19059_003M)


#combine into 1 dataframe
Retirement_2010_2019<-rbind(Retirement_2010,Retirement_2011,Retirement_2012,Retirement_2013,Retirement_2014,Retirement_2015,Retirement_2016,Retirement_2017,Retirement_2018,Retirement_2019)

#export!
write.csv(Retirement_2010_2019, file = '~/r_folder/Retirement/Retirement_2010_2019.csv')



#clean Population data
Population_2010 <- read.csv("Population_2010.csv", header = TRUE)
Population_2011 <- read.csv("Population_2011.csv", header = TRUE)
Population_2012 <- read.csv("Population_2012.csv", header = TRUE)
Population_2013 <- read.csv("Population_2013.csv", header = TRUE)
Population_2014 <- read.csv("Population_2014.csv", header = TRUE)
Population_2015 <- read.csv("Population_2015.csv", header = TRUE)
Population_2016 <- read.csv("Population_2016.csv", header = TRUE)
Population_2017 <- read.csv("Population_2017.csv", header = TRUE)
Population_2018 <- read.csv("Population_2018.csv", header = TRUE)
Population_2019 <- read.csv("Population_2019.csv", header = TRUE)


for (i in Population_2010){
  Population_2010$Year[i]<- "2010"
}
for (i in Population_2011){
  Population_2011$Year[i]<- "2011"
}
for (i in Population_2012){
  Population_2012$Year[i]<- "2012"
}
for (i in Population_2013){
  Population_2013$Year[i]<- "2013"
}
for (i in Population_2014){
  Population_2014$Year[i]<- "2014"
}
for (i in Population_2015){
  Population_2015$Year[i]<- "2015"
}
for (i in Population_2016){
  Population_2016$Year[i]<- "2016"
}
for (i in Population_2017){
  Population_2017$Year[i]<- "2017"
}
for (i in Population_2018){
  Population_2018$Year[i]<- "2018"
}
for (i in Population_2019){
  Population_2019$Year[i]<- "2019"
}

#Remove first line of bad data
Population_2010 <- Population_2010[-1,]
Population_2011 <- Population_2011[-1,]
Population_2012 <- Population_2012[-1,]
Population_2013 <- Population_2013[-1,]
Population_2014 <- Population_2014[-1,]
Population_2015 <- Population_2015[-1,]
Population_2016 <- Population_2016[-1,]
Population_2017 <- Population_2017[-1,]
Population_2018 <- Population_2018[-1,]
Population_2019 <- Population_2019[-1,]

Population_2010 <- Population_2010%>%
  select(NAME,DP05_0022E,Year)
Population_2011 <- Population_2011%>%
  select(NAME,DP05_0018E,Year)
Population_2012 <- Population_2012%>%
  select(NAME,DP05_0018E,Year)
Population_2013 <- Population_2013%>%
  select(NAME,DP05_0018E,Year)
Population_2014 <- Population_2014%>%
  select(NAME,DP05_0018E,Year)
Population_2015 <- Population_2015%>%
  select(NAME,DP05_0018E,Year)
Population_2016 <- Population_2016%>%
  select(NAME,DP05_0022E,Year)
Population_2017 <- Population_2017%>%
  select(NAME,DP05_0025E,Year)
Population_2018 <- Population_2018%>%
  select(NAME,DP05_0025E,Year)
Population_2019 <- Population_2019%>%
  select(NAME,DP05_0025E,Year)

Population_2010<- Population_2010%>%
  rename(Population_over_18 = DP05_0022E)
Population_2011<- Population_2011%>%
  rename(Population_over_18 = DP05_0018E)
Population_2012<- Population_2012%>%
  rename(Population_over_18 = DP05_0018E)
Population_2013<- Population_2013%>%
  rename(Population_over_18 = DP05_0018E)
Population_2014<- Population_2014%>%
  rename(Population_over_18 = DP05_0018E)
Population_2015<- Population_2015%>%
  rename(Population_over_18 = DP05_0018E)
Population_2016<- Population_2016%>%
  rename(Population_over_18 = DP05_0022E)
Population_2017<- Population_2017%>%
  rename(Population_over_18 = DP05_0025E)
Population_2018<- Population_2018%>%
  rename(Population_over_18 = DP05_0025E)
Population_2019<- Population_2019%>%
  rename(Population_over_18 = DP05_0025E)



Population_2010_2019<- rbind(Population_2010,Population_2011,Population_2012,Population_2013,Population_2014,Population_2015,Population_2016,Population_2017,Population_2018,Population_2019)

#export
write.csv(Population_2010, file = '~/r_folder/Retirement/Population_2010.csv')
write.csv(Population_2011, file = '~/r_folder/Retirement/Population_2011.csv')
write.csv(Population_2012, file = '~/r_folder/Retirement/Population_2012.csv')
write.csv(Population_2013, file = '~/r_folder/Retirement/Population_2013.csv')
write.csv(Population_2014, file = '~/r_folder/Retirement/Population_2014.csv')
write.csv(Population_2015, file = '~/r_folder/Retirement/Population_2015.csv')
write.csv(Population_2016, file = '~/r_folder/Retirement/Population_2016.csv')
write.csv(Population_2017, file = '~/r_folder/Retirement/Population_2017.csv')
write.csv(Population_2018, file = '~/r_folder/Retirement/Population_2018.csv')
write.csv(Population_2019, file = '~/r_folder/Retirement/Population_2019.csv')

write.csv(Population_2010_2019, file = '~/r_folder/Retirement/Population_2010_2019.csv')
