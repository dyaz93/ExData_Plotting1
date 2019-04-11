data <- read.table("household_power_consumption.txt", na.strings="?", 
                   header=TRUE, sep=";", stringsAsFactors=FALSE)
data[, 1] <- as.Date(data[, 1], "%d/%m/%Y")

# Subset data
data <- subset(data, data$Date=="2007-02-01" | data$Date=="2007-02-02")

data$Time <- paste(data$Date, data$Time)
data$Time <- strptime(data$Time, "%F %H:%M:%S")

# Set mfcol for 2x2 plot area
par(mfcol=c(2,2))

# Plotting
plot(data$Time, data$Global_active_power, type="l", xlab="", 
     ylab="Global Active Power")

plot(data$Time, data$Sub_metering_1, type = "n", xlab="", 
     ylab="Energy sub metering")
lines(data$Time, data$Sub_metering_1)
lines(data$Time, data$Sub_metering_2, col = "red")
lines(data$Time, data$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1), col=c("black", "red", "blue"), cex=0.5, bty="n")

plot(data$Time, data$Voltage, type="l", xlab="datetime", 
     ylab="Voltage")

plot(data$Time, data$Global_reactive_power, type="l", xlab="datetime", 
     ylab="Global_reactive_power")

# Create PNG file with transparent background
par(bg=NA)
dev.copy(png, "plot4.png")
dev.off()