setwd("~/RWorkingDirectory/Course_4/assignment_1")

data <- read.table("data/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

#subset data to only relevant dates
subsetData <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]
subsetData$dateTime <- strptime(paste(subsetData$Date, subsetData$Time), "%d/%m/%Y %H:%M:%S")

png(file = "plot4.png", width=480, height=480, units="px")

par(mfrow = c(2,2))

#Plot 1 (top left)
plot(subsetData$dateTime, subsetData$Global_active_power, type = "n", xlab = "", ylab="Global Active Power")
lines(subsetData$dateTime, subsetData$Global_active_power)

#Plot 2(top right)
plot(subsetData$dateTime, subsetData$Voltage, type = "n", xlab="datetime", ylab="voltage")
lines(subsetData$dateTime, subsetData$Voltage, col="black")

#Plot 3 (bottom left)
plot(subsetData$dateTime, subsetData$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(subsetData$dateTime, subsetData$Sub_metering_1, col="black")
lines(subsetData$dateTime, subsetData$Sub_metering_2, col="red")
lines(subsetData$dateTime, subsetData$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),bty = "n", lty=c(1,1), col=c("black", "red", "blue"))

#Plot 4 (bottom right)
plot(subsetData$dateTime, subsetData$Global_reactive_power, type = "n", xlab="datetime", ylab="Global_reactive_power")
lines(subsetData$dateTime, subsetData$Global_reactive_power, col="black")

dev.off()
