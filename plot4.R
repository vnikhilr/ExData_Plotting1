# Exploratory Data Analysis Course Project 1
# File name: plot4.R
# This code has been tested on windows 10
# Nikhil Reddy

## Setting working directory
setwd("C:/Users/getti_000/Documents/Coursera Assignment Data/Exploratory Data Analysis/Assignment 1")


## loading the full dataset.
dataFile <- "./data/household_power_consumption.txt"
expData_big <- read.table(dataFile,
                   header = TRUE,
                   sep = ";",
                   colClasses = c("character", "character", rep("numeric",7)),
                   na = "?")

## Subsetting to keep data for dates 1/2/2007 & 1/2/2007 only
subset <- expData_big$Date == "1/2/2007" | expData_big$Date == "2/2/2007"
expData <- expData_big[subset, ]

dt <- paste(expData$Date, expData$Time)
expData$DateTime <- strptime(dt, "%d/%m/%Y %H:%M:%S")

## Initializing PNG screen device
png(filename = "plot4.png", 
    width = 480, height = 480, 
    units = "px", bg = "white")
## Screen device with a grid of 2 rows and 2 columns
par(mfrow = c(2, 2))

## Plot1 - row 1,  column 1
plot(expData$DateTime, expData$Global_active_power, 
     type = "l",
     xlab = "", ylab = "Global Active Power")

## Plot2 - row 1,  column 2
plot(expData$DateTime, expData$Voltage,
     type = "l",
     xlab = "datetime", ylab = "Voltage")

## Plot3 - row 2,  column 1
plot(expData$DateTime, expData$Sub_metering_1, 
     type = "l",
     col = "black",
     xlab = "", ylab = "Energy sub metering")
lines(expData$DateTime, expData$Sub_metering_2, col = "red")
lines(expData$DateTime, expData$Sub_metering_3, col = "blue")

## Adding legent to top right corner (- Border)
legend("topright", 
       bty = "n",
       col = c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 1)

## Plot4 - row 2,  column 4
plot(expData$DateTime, expData$Global_reactive_power, 
     type = "l",
     col = "black",
     xlab = "datetime", ylab = colnames(expData)[4])

## Closing screen device
dev.off()
