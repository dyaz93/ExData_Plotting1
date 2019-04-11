data <- read.table("household_power_consumption.txt", na.strings="?", 
                   header=TRUE, sep=";", stringsAsFactors=FALSE)
data[, 1] <- as.Date(data[, 1], "%d/%m/%Y")

# Subset data
data <- subset(data, data$Date=="2007-02-01" | data$Date=="2007-02-02")

# Plotting
hist(data$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

# Create PNG file with transparent background
par(bg=NA)
dev.copy(png, "plot1.png")
dev.off()