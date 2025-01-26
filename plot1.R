# Load data
data <- read.table("household_power_consumption.txt", 
                   header = TRUE, 
                   sep = ";", 
                   na.strings = "?", 
                   colClasses = c("character", "character", rep("numeric", 7)))

# Subset to 2007-02-01 and 2007-02-02
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data_sub <- data[data$Date %in% as.Date(c("2007-02-01", "2007-02-02")), ]

# Create histogram
png("plot1.png", width = 480, height = 480)
hist(data_sub$Global_active_power, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()