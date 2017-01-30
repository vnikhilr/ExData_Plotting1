# Exploratory Data Analysis Course Project 1
# File name: plot1.R
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
#rownames(expData) <- 1:nrow(expData)

## Initializing PNG screen device
png(filename = "plot1.png", 
    width = 480, height = 480, 
    units = "px", bg = "white")

## Create Histogram
hist(expData$Global_active_power, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",
     breaks = 12, ylim = c(0, 1200))

## Closing screen device
dev.off()
