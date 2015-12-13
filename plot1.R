##This code creates the first plot for Course Project 1

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

##Draw the histogram
powerCons$Global_active_power <-as.numeric(as.character(powerCons$Global_active_power))
with(powerCons, hist(Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))
