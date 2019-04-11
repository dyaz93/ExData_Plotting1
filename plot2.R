data <- read.table("household_power_consumption.txt", na.strings="?", 
                   header=TRUE, sep=";", stringsAsFactors=FALSE)
data[, 1] <- as.Date(data[, 1], "%d/%m/%Y")

# Subset data
data <- subset(data, data$Date=="2007-02-01" | data$Date=="2007-02-02")

data$Time <- paste(data$Date, data$Time)
data$Time <- strptime(data$Time, "%F %H:%M:%S")

# Plotting
plot(data$Time, data$Global_active_power, type="l", xlab="", 
     ylab="Global Active Power (kilowatts)")

# Create PNG file with transparent background
par(bg=NA)
dev.copy(png, "plot2.png")
dev.off()