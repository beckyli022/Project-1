## Read data ##
rm(list=ls())
dev.off()
setwd("H:\\Coursera\\Data Science\\Exploratory Data Analysis\\Project 1\\")
data <- read.table("Data\\household_power_consumption.txt", sep=";", header = TRUE )

## Subset data ##
data1 <- data[as.Date(data$Date, "%d/%m/%Y") >= as.Date("2007-02-01","%Y-%m-%d")
              & as.Date(data$Date, "%d/%m/%Y") <= as.Date("2007-02-02","%Y-%m-%d"),]

## Open PNG file ##
png(file="plot1.png", width = 480, height = 480)

## Plot #1 ##
data1$Global_active_power<-as.numeric(as.character(data1$Global_active_power))

hist(data1$Global_active_power, col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()

