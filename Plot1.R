## Set working directory and download file
setwd("C:/Users/fkalsekar/Documents/R/")
downloadURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
downloadFile <- "./Data/exdata%2Fdata%2Fhousehold_power_consumption.zip"
householdFile <- "./Data/household_power_consumption.txt"
plotData <- read.table(householdFile, header=T, sep=";", na.strings="?")

## set time variable
finalData <- plotData[plotData$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(finalData$Date, finalData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
finalData <- cbind(SetTime, finalData)

##Creating png file
png(filename='plot1.png', width=480, height=480, units='px')

##Generating Plot 1
hist(finalData$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

