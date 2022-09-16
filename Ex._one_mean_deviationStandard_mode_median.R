###MEAN - DEVIATION_STANDARD - MEDIAN
# the data - https://www.kaggle.com/datasets/elikplim/forest-fires-data-set?resource=download
#P. Cortez and A. Morais. A Data Mining Approach to Predict Forest Fires using Meteorological Data.
#In J. Neves, M. F. Santos and J. Machado Eds., New Trends in Artificial Intelligence,
#Proceedings of the 13th EPIA 2007 - Portuguese Conference on Artificial Intelligence, December,
#Guimaraes, Portugal, pp. 512-523, 2007. APPIA, ISBN-13 978-989-95618-0-9.

#Import dataset 
#check where the dataset should be
#The table has, besides month, day, temp, relative humidity, wind, rain, area:
#Fine Fuel Moisture code (FFMC) - Rain, RH, Temp, wind; 
#Duff Moisture Code (DMC) - rain, RH, Temp; 
#Drought Code (DC) - Rain, Temp; 
#Initial Spread Index (ISI) - FFMC, wind. 


getwd()

#change workbook
setwd("D:/Aislangc2014/Projetos_Rstudio/Initial_information")

df <- read.csv("forestfires.csv",header = TRUE)

#installing new libraries
install.packages("dplyr")
install.packages("ggplot2")
install.packages("tidyverse")
install.packages("gridExtra")


#import libraries to work
library(dplyr)
library(ggplot2)
library(tidyverse)
library(gridExtra)

#Questions to be answered with this code:
#1 - what are the mean values and standard deviation of the numerical data?
#2 - what are the mean values and standard deviation of the temperature, when the "n" of the samples are (10, 50, 100, 200) selected in a simple and systematic random way?

#select the data to work:
df
df_numerical <- select(df, FFMC, DMC, DC, ISI, temp, RH, wind, rain, area)

df_numerical

#look the first lines e columns
head(df_numerical)

#check the type of data
str(df_numerical)

#getting the mean and median of all numerical data
#FFMC
mean(df_numerical$FFMC) #90.64
median(df_numerical$FFMC) #91.6
sd(df_numerical$FFMC) #5.52

#DMC
mean(df_numerical$DMC) #110.87
median(df_numerical$DMC) #108.3
sd(df_numerical$DMC) #64.05

#DC
mean(df_numerical$DC) #547.94
median(df_numerical$DC) #664.2
sd(df_numerical$DC) #248.07

#ISI
mean(df_numerical$ISI) #9.02
median(df_numerical$ISI) #8.4
sd(df_numerical$ISI) #4.56

#RH
mean(df_numerical$RH) #44.29
median(df_numerical$RH) #42
sd(df_numerical$RH) #16.32

#wind
mean(df_numerical$wind) #4.02
median(df_numerical$wind) #4
sd(df_numerical$wind) #1.80

#rain
mean(df_numerical$rain) #0.02
median(df_numerical$rain) #0
sd(df_numerical$rain) #0.3

#temp
mean(df_numerical$temp) #18.89
median(df_numerical$temp) #19.3
sd(df_numerical$temp) #5.81

#area
mean(df_numerical$area) #12.85
median(df_numerical$area) #0.52
sd(df_numerical$area) #63.66


#answer = The mean values and standard deviation presented for the data set df_numerical is:
#FFMC (mean 90.64, SD 5.52)
#DMC (mean 110.87, SD 64.05)
#DC (mean 547.94, SD 248.07)
#ISI (mean 9.02, SD 4.56)
#RH (mean 44.29, SD 16.32)
#wind (mean 4.02, SD 1.80)
#rain (mean 0.02, SD 0.3)
#temp (mean 18.89, SD 5.81)
#area (mean 12.85, SD 63.66)

#the variable that presented the highest standard deviation was DC, while the lowest standard deviation was rain.

#graphic

boxplot(df_numerical)



#2:

temp <- read.csv("temperature_10.csv",header = TRUE)

#temp_10
mean(temp$N_10) #19.43
median(temp$N_10) #21
sd(temp$N_10) #3.83

boxplot(temp)

temp50 <- read.csv("temperature_50.csv",header = TRUE)

#temp_50
mean(temp50$N_50) #24.32
median(temp50$N_50) #19.7
sd(temp50$N_50) #38.11

boxplot(temp50)

temp100 <- read.csv("temperature_100.csv",header = TRUE)

#temp_100
mean(temp100$N_100) #17.7
median(temp100$N_100) #18.15
sd(temp100$N_100) #5.46

boxplot(temp100)

temp200 <- read.csv("temperature_200.csv",header = TRUE)

#temp_200
mean(temp200$N_200) #19.20
median(temp200$N_200) #19.4
sd(temp200$N_200) #5.69

#graphic 

boxplot(temp200)

#answer = the mean values and standard deviation presented for the temperature data set, where they were randomly selected (10, 50, 100, 200) is:

#temp_10 (mean 19.43, SD 3.83)
#temp_50 (mean 24.32, SD 38.11)
#temp_100 (mean 17.7, SD 5.46)
#temp_200 (mean 19.20, SD 5.69)

#all temperatures had a temperature similar to the original dataset. with the exception of Temp_50 which had a very high standard deviation.
