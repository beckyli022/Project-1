## Read data ##
rm(list=ls())
dev.off()
setwd("H:\\Coursera\\Data Science\\Exploratory Data Analysis\\Project 1\\")
data <- read.table("Data\\household_power_consumption.txt", sep=";", header = TRUE )

## Subset data ##
data1 <- data[as.Date(data$Date, "%d/%m/%Y") >= as.Date("2007-02-01","%Y-%m-%d")
              & as.Date(data$Date, "%d/%m/%Y") <= as.Date("2007-02-02","%Y-%m-%d"),]

## Open PNG file ##
png(file="plot2.png", width = 480, height = 480)

### Plot #2 ###
plot(data1$Global_active_power, type = "l", 
     xlab="", ylab="Global Active Power (kilowatts)", xaxt='n')
axis(1, at = c(0,1441,2881), labels = c("Thu","Fri","Sat"))
dev.off()
