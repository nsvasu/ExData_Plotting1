#loading the data set
full_data <- read.csv(file="household_power_consumption.txt", 
				sep = ";", 
				na.strings = "?",
				header = T)

#subsetting the dataset for date range 02/02/2007 to 02/02/2007				
sub_data <- full_data[full_data$Date == "1/2/2007" | full_data$Date == "2/2/2007", ]

#string to datetime format
dt <- paste(sub_data$Date, sub_data$Time)
sub_data$dt <- strptime(dt, "%d/%m/%Y %H:%M:%S")

#Creating the plot
#four plots
par(mfcol = c(2, 2))

#row1:col1 plot
plot(sub_data$dt, sub_data$Global_active_power, 
		type = "l", 
		xlab = "", 
		ylab = "Global Active Power (kilowatts)")

#row2:col1 plot
plot(sub_data$dt, sub_data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy Sub Metering")
lines(sub_data$dt, sub_data$Sub_metering_2, col="red")
lines(sub_data$dt, sub_data$Sub_metering_3, col="blue")
#creating the legend
legend("topright", legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"), 
			col = c("black", "red", "blue"), 
			lty = 1, 
			lwd = 2, 
			bty = "n")


#row1:col2 plot
plot(sub_data$dt, sub_data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

#row2:col2 plot
plot(sub_data$dt, sub_data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")


#creating and saving the png file for the plot
dev.copy(png, file = "plot4.png", width = 480, height = 480, units = "px")
dev.off()

#removing the data
rm(list=ls())