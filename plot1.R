setwd("~/RWorkingDirectory/Course_4/assignment_1")
data <- read.table("data/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

#subset data to only relevant dates
subsetData <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]

png(file = "plot1.png", width=480, height=480, units="px")
hist(subsetData$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

dev.off()
