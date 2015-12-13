##This code creates the third plot for Course Project 1

##Reading the data
rawdata <- read.table("household_power_consumption.txt", sep=";", header = TRUE)
powerCons <- rawdata[ which(rawdata$Date=="1/2/2007" | rawdata$Date=="2/2/2007"), ]
remove(rawdata)

##Clean up the data
powerCons$Date <- as.Date(powerCons$Date, "%d/%m/%Y")
powerCons$DateTime <- paste(powerCons$Date, " ", powerCons$Time)
powerCons$DateTime <- as.POSIXct(powerCons$DateTime)
powerCons$Sub_metering_1 <-as.numeric(as.character(powerCons$Sub_metering_1))
powerCons$Sub_metering_2 <-as.numeric(as.character(powerCons$Sub_metering_2))
powerCons$Sub_metering_3 <-as.numeric(as.character(powerCons$Sub_metering_3))

##Load the library
library(datasets)

##Draw the line chart
plot(powerCons$Sub_metering_1, type="l", ylim=range(powerCons$Sub_metering_1), ann=T, xaxt='n', xlab=" ", ylab="Energy sub metering", cex.lab=0.8, cex=0.8)  #draw the plot and the first line
axis(1, at=1, lab=c("Thu")) #label the x-axis
axis(1, at=1439, lab=c("Fri")) #label the x-axis
axis(1, at=2879, lab=c("Sat")) #label the x-axis
lines(powerCons$Sub_metering_2, type="l", col="red")   #add the second line for Sub_metering_2
lines(powerCons$Sub_metering_3, type="l", col="blue")   #add the third line for Sub_metering_3
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), col=c("black", "red", "blue"), cex=0.8)
