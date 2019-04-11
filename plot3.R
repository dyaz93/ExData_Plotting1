data <- read.table("household_power_consumption.txt", na.strings="?", 
                   header=TRUE, sep=";", stringsAsFactors=FALSE)
data[, 1] <- as.Date(data[, 1], "%d/%m/%Y")

# Subset data
data <- subset(data, data$Date=="2007-02-01" | data$Date=="2007-02-02")

data$Time <- paste(data$Date, data$Time)
data$Time <- strptime(data$Time, "%F %H:%M:%S")

# Plotting
plot(data$Time, data$Sub_metering_1, type = "n", xlab="", 
     ylab="Energy sub metering")
lines(data$Time, data$Sub_metering_1)
lines(data$Time, data$Sub_metering_2, col = "red")
lines(data$Time, data$Sub_metering_3, col = "blue")

# Add legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1), col=c("black", "red", "blue"), cex=0.6)

# Create PNG file with transparent background
par(bg=NA)
dev.copy(png, "plot3.png")
dev.off()