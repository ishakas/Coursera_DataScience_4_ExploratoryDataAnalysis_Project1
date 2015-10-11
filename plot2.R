setwd("~/RWorkingDirectory/Course_4/assignment_1")
data <- read.table("data/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

#subset data to only relevant dates
subsetData <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]

# create date time column
subsetData$dateTime <- strptime(paste(subsetData$Date, subsetData$Time), "%d/%m/%Y %H:%M:%S")

png(file = "plot2.png", width=480, height=480, units="px")

plot(subsetData$dateTime, subsetData$Global_active_power, type = "n", xlab = "", ylab="Global Active Power (kilowatts)")
lines(subsetData$dateTime, subsetData$Global_active_power)

dev.off()
