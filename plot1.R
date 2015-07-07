# Script to create plot 1

# sets working directory to directory with "household_power_consumption.txt"
setwd("/Users/earlbrown/coursera/explore_data/ExData_Plotting1")

# loads data
elec <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

# subsets data to two days in Feb 2007
elec <- elec[elec$Date %in% c("1/2/2007", "2/2/2007"),]

# saves histogram of Global Active Power to hard drive
png("plot1.png", width = 480, height = 480)
hist(elec$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()
