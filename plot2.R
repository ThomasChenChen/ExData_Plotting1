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

# Create time series plot
png("plot2.png", width = 480, height = 480)
plot(data_sub$datetime, data_sub$Global_active_power, 
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power (kilowatts)")
dev.off()