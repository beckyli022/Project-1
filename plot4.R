## Read data ##
rm(list=ls())
dev.off()
setwd("H:\\Coursera\\Data Science\\Exploratory Data Analysis\\Project 1\\")
data <- read.table("Data\\household_power_consumption.txt", sep=";", header = TRUE )

## Subset data ##
data1 <- data[as.Date(data$Date, "%d/%m/%Y") >= as.Date("2007-02-01","%Y-%m-%d")
              & as.Date(data$Date, "%d/%m/%Y") <= as.Date("2007-02-02","%Y-%m-%d"),]

## Open png file ##
png(file="plot4.png", width = 480, height = 480)

### Plot #4 ###
par(mfrow=c(2,2))

plot(data1$Global_active_power, type = "l", 
     xlab="", ylab="Global Active Power", xaxt='n')
axis(1, at = c(0,1441,2881), labels = c("Thu","Fri","Sat"))

data1$Voltage<-as.numeric(as.character(data1$Voltage))
plot(data1$Voltage, type = "l", 
     xlab="datetime", ylab="Voltage", xaxt='n')
axis(1, at = c(0,1441,2881), labels = c("Thu","Fri","Sat"))

plot(data1$Sub_metering_1, type = "l", xlab ="", ylab = "Energy sub metering", xaxt='n')
lines(data1$Sub_metering_2, col = "red")
lines(data1$Sub_metering_3, col = "blue")
axis(1, at = c(0,1441,2881), labels = c("Thu","Fri","Sat"))
legend("topright", bty="n", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty=1,col=c("black","red","blue"), cex=0.9)

data1$Global_reactive_power<-as.numeric(as.character(data1$Global_reactive_power))
plot(data1$Global_reactive_power, type = "l", 
     xlab="datetime", ylab="Global_reactive_power", xaxt='n')
axis(1, at = c(0,1441,2881), labels = c("Thu","Fri","Sat"))

dev.off()
