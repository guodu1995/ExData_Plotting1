files <- file("household_power_consumption.txt")
data <- read.table(text = grep("^[1,2]/2/2007",readLines(files),value=TRUE), 
                   sep = ';', col.names = c("Date", "Time", "Global_active_power",
                                            "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", 
                                            "Sub_metering_2", "Sub_metering_3"), na.strings = '?')
png(filename = "plot3.png", width = 480, height = 480, units = "px")
plot(data$DateTime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(data$DateTime, data$Sub_metering_2,col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), legend = c(
        "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1)
dev.off()