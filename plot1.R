# Plot 1 - Exploratory Data Analysis Assignment 1
# Author: Joseph Figuracion // TheLastMonolith @github

# Read data set that is semi-colon seperated from path file.
data <- read.table("./data/household_power_consumption.txt", sep = ";", 
                 na.strings = "?", header = TRUE)

# Convert the Date Column as date class and specify format.
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Filter dates from 2007-02-01 to 2007-02-02
dataSub <- subset(data, data$Date == "2007-02-01" | data$Date == "2007-02-02")

#  Use PNG as graphic device and set size to 480 x 480 pixels
png("plot1.png", width = 480, height = 480)

# Generate the plot
with(dataSub, hist(Global_active_power,
                   main = "Global Active Power",
                   xlab = "Global Active Power (kilowatts)",
                   ylab = "Frequency",
                   col = "red"))

# Turn off device
dev.off()
