rm(list=ls()) # clear environment
set.seed(6583) # setting seed for reproducibility, in case of random number gen.
library("ggplot2")
library("lubridate")

HEC <- read.csv("D:/Coursera/ExData_Plotting1/WorkingData/power_consumption_2_day.csv", header = TRUE)

summary(HEC) # No missing values found, 0's assumed to be correct values
View(HEC) # displays the first 1000 rows

wkday <- wday(HEC$Date, label = TRUE, abbr=TRUE) # To extract weekday, not used just wanted to check functionality

#convert individual variables and convert
datetime <- paste(HEC$Date, HEC$Time)
DateTime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")

par(mfrow = c(1,1))

#multi-plot - plot&lines 
plot(DateTime, HEC$Sub_metering_1, type = "l", col='black', xlab = "", ylab = "Energy sub metering")
lines(DateTime, HEC$Sub_metering_2, type = "l", col = 'red', xlab = "", ylab = "Energy sub metering")
lines(DateTime, HEC$Sub_metering_3, type = "l", col = 'blue',xlab = "", ylab = "Energy sub metering")
legend("topright",  col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty=1)

#copy the png file to working directory
dev.copy(png, file="Plot3.png", width=480, height=480)
dev.off()
