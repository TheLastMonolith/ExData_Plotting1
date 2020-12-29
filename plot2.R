# Plot 2 - Exploratory Data Analysis Assignment 1
# Author: Joseph Figuracion // TheLastMonolith @github

# Read data set that is semi-colon seperated from path file.
data <- read.table("./data/household_power_consumption.txt", sep = ";", 
                   na.strings = "?", header = TRUE)

# Convert the Date Column as date class and specify format.
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Filter dates from 2007-02-01 to 2007-02-02
dataSub <- subset(data, data$Date == "2007-02-01" | data$Date == "2007-02-02")

#  Use PNG as graphic device and set size to 480 x 480 pixels
png("plot2.png", width = 480, height = 480)

# Generate the plot, use `strptime` to turn Date and Time into POSIXlt class 
with(dataSub, plot(x = strptime(paste(Date, Time), "%Y-%m-%d %H:%M:%S"),
                   y = Global_active_power,
                   xlab = "",
                   ylab = "Global Active Power (kilowatts)",
                   type = "l"))

# Turn off device
dev.off()
