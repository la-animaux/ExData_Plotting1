##This code creates the second plot for Course Project 1

##Reading the data
rawdata <- read.table("household_power_consumption.txt", sep=";", header = TRUE)
powerCons <- rawdata[ which(rawdata$Date=="1/2/2007" | rawdata$Date=="2/2/2007"), ]
remove(rawdata)

##Clean up the data
powerCons$Date <- as.Date(powerCons$Date, "%d/%m/%Y")
powerCons$DateTime <- paste(powerCons$Date, " ", powerCons$Time)
powerCons$DateTime <- as.POSIXct(powerCons$DateTime)
powerCons$Global_active_power <-as.numeric(as.character(powerCons$Global_active_power))

##Load the library
library(datasets)

##Set the ranges for x and y axes
xrange <- range(powerCons$DateTime)
yrange <- range(powerCons$Global_active_power)

##Draw the line chart
plot(powerCons$Global_active_power, type="l", ylim=range(powerCons$Global_active_power), ann=T, xaxt='n', xlab=" ", ylab="Global active power (kilowatts)")
axis(1, at=1, lab=c("Thu")) #label the x-axis
axis(1, at=1439, lab=c("Fri")) #label the x-axis
axis(1, at=2879, lab=c("Sat")) #label the x-axis