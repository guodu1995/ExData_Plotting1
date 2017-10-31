files <- file("household_power_consumption.txt")
data <- read.table(text = grep("^[1,2]/2/2007",readLines(files),value=TRUE), 
                   sep = ';', col.names = c("Date", "Time", "Global_active_power",
                                            "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", 
                                            "Sub_metering_2", "Sub_metering_3"), na.strings = '?')
#plot2
data$Date <- as.Date(data$Date, format = '%d/%m/%Y')
data$DateTime <- strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")
png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(data$DateTime, data$Global_active_power, xlab = '', ylab = 'Global Active Power (kilowatt)', type = 'l')
dev.off()