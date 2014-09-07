## Read data ##
rm(list=ls())
dev.off()
setwd("H:\\Coursera\\Data Science\\Exploratory Data Analysis\\Project 1\\")
data <- read.table("Data\\household_power_consumption.txt", sep=";", header = TRUE )

## Subset data ##
data1 <- data[as.Date(data$Date, "%d/%m/%Y") >= as.Date("2007-02-01","%Y-%m-%d")
              & as.Date(data$Date, "%d/%m/%Y") <= as.Date("2007-02-02","%Y-%m-%d"),]

## Open png file ##
png(file="plot3.png", width = 480, height = 480)

### Plot #3 ###
data1$Sub_metering_1<-as.numeric(as.character(data1$Sub_metering_1))
data1$Sub_metering_2<-as.numeric(as.character(data1$Sub_metering_2))
data1$Sub_metering_3<-as.numeric(as.character(data1$Sub_metering_3))

par(mfrow=c(1,1))
plot(data1$Sub_metering_1, type = "l", xlab ="", ylab = "Energy sub metering", xaxt='n')
lines(data1$Sub_metering_2, col = "red")
lines(data1$Sub_metering_3, col = "blue")
axis(1, at = c(0,1441,2881), labels = c("Thu","Fri","Sat"))
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty=1,col=c("black","red","blue"), xjust = 0.5,cex = 1, y.intersp = 0.9,seg.len = 1.25)

dev.off()
