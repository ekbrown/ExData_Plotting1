# Script to create plot 4

## uncomment next line, if need be
# install.packages("data.table"); install.packages("dplyr"); install.packages("lubridate")

# clear memory
rm(list = ls(all = T))

# sets working directory to directory with "household_power_consumption.txt"
setwd("/Users/earlbrown/coursera/explore_data/ExData_Plotting1")

# loads data set
library("data.table")
elec <- fread("household_power_consumption.txt", sep = ";", na.strings = "?")

# subsets data to two days in Feb 2007, combines Date and Time, and changes date_time to time class
library("dplyr")
library("lubridate")
elec <- 
  elec %>% 
  filter(Date %in% c("1/2/2007", "2/2/2007")) %>% 
  mutate(
    date_time = paste(Date, Time),
    date_time = dmy_hms(date_time)
  )

# saves plot to hard drive
png("plot4.png", width = 480, height = 480)

# sets up 2 x 2 grid
par(mfcol = c(2, 2))

# top left plot
with(elec, plot(date_time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))

# bottom left plot
with(elec, plot(date_time, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))
with(elec, lines(date_time, Sub_metering_1))
with(elec, lines(date_time, Sub_metering_2, col = "red"))
with(elec, lines(date_time, Sub_metering_3, col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))

# top right plot
with(elec, plot(date_time, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))

# bottom right plot
with(elec, plot(date_time, Global_reactive_power, type = "l", xlab = "datetime"))

# closes device
dev.off()

