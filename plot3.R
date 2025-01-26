# Load data
data <- read.table("household_power_consumption.txt", 
                   header = TRUE, 
                   sep = ";", 
                   na.strings = "?", 
                   colClasses = c("character", "character", rep("numeric", 7)))

# Subset and create datetime
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data_sub <- data[data$Date %in% as.Date(c("2007-02-01", "2007-02-02")), ]
data_sub$datetime <- as.POSIXct(paste(data_sub$Date, data_sub$Time), 
                                format = "%Y-%m-%d %H:%M:%S")

# Create sub-metering plot
png("plot3.png", width = 480, height = 480)
plot(data_sub$datetime, data_sub$Sub_metering_1, 
     type = "l", 
     xlab = "", 
     ylab = "Energy sub metering (watt-hour)")
lines(data_sub$datetime, data_sub$Sub_metering_2, col = "red")
lines(data_sub$datetime, data_sub$Sub_metering_3, col = "blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), 
       lty = 1, 
       bty = "n")
dev.off()