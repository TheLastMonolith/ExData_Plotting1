# Plot 4 - Exploratory Data Analysis Assignment 1
# Author: Joseph Figuracion // TheLastMonolith @github

# Read data set that is semi-colon seperated from path file.
data <- read.table("./data/household_power_consumption.txt", sep = ";", 
                   na.strings = "?", header = TRUE)

# Convert the Date Column as date class and specify format.
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Filter dates from 2007-02-01 to 2007-02-02
dataSub <- subset(data, data$Date == "2007-02-01" | data$Date == "2007-02-02")

#  Use PNG as graphic device and set size to 480 x 480 pixels
png("plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))

# Plot 1 
with(dataSub, plot(x = strptime(paste(Date, Time), "%Y-%m-%d %H:%M:%S"),
                   y = Global_active_power,
                   xlab = "",
                   ylab = "Global Active Power (kilowatts)",
                   type = "l"))
# Plot 2
with(dataSub, plot(x = strptime(paste(Date, Time), "%Y-%m-%d %H:%M:%S"),
                   y = Voltage,
                   xlab = "datetime",
                   ylab = "Voltage",
                   type = "l"))
# Plot 3
with(dataSub, plot(x = strptime(paste(Date, Time), "%Y-%m-%d %H:%M:%S"),
                   y = Sub_metering_1,
                   xlab = "",
                   ylab = "Energy sub metering",
                   type = "l"))
with(dataSub, lines(x = strptime(paste(Date, Time), "%Y-%m-%d %H:%M:%S"),
                    y = Sub_metering_2, col = "red"))
with(dataSub, lines(x = strptime(paste(Date, Time), "%Y-%m-%d %H:%M:%S"),
                    y = Sub_metering_3, col = "blue"))
legend("topright", 
       col = c('black', 'red', 'blue'),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = c(1,1),
       bty = "n",
       cex = 0.75)

# Plot 4
with(dataSub, plot(x = strptime(paste(Date, Time), "%Y-%m-%d %H:%M:%S"),
                   y = Global_reactive_power,
                   xlab = "datetime",
                   type = "l"))

# Turn off device
dev.off()
