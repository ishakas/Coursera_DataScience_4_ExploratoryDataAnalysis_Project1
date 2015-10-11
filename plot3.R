setwd("~/RWorkingDirectory/Course_4/assignment_1")
data <- read.table("data/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

#subset data to only relevant dates
subsetData <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]

# striptime
subsetData$dateTime <- strptime(paste(subsetData$Date, subsetData$Time), "%d/%m/%Y %H:%M:%S")

png(file = "plot3.png", width=480, height=480, units="px")
plot(subsetData$dateTime, subsetData$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(subsetData$dateTime, subsetData$Sub_metering_1, col="black")
lines(subsetData$dateTime, subsetData$Sub_metering_2, col="red")
lines(subsetData$dateTime, subsetData$Sub_metering_3, col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), col=c("black", "red", "blue"))
dev.off()
