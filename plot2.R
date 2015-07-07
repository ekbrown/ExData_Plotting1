# Script to create plot 2

## uncomment next line, if need be
# install.packages("data.table"); install.packages("dplyr")

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
png("plot2.png", width = 480, height = 480)
with(elec, plot(date_time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()
