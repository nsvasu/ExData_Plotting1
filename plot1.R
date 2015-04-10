#loading the data set
full_data <- read.csv(file = "household_power_consumption.txt", 
				sep = ";", 
				na.strings = "?",
				header = T)
				
full_data$Date <- as.Date(full_data$Date, format = "%d/%m/%Y")

#subsetting the dataset for date rance 02/02/2007 t0 02/02/2007
sub_data <- subset(full_data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

#Creating the histogram
hist(sub_data$Global_active_power, xlab = "Global Active Power (kilowatts)", 
				   ylab = "Frequency", 
				   main = "Global Active Power", 
				   col = "Red")

#creating and saving the png file for the histogram
dev.copy(png, file = "plot1.png", 
		width = 480, 
		height = 480, 
		units = "px")
dev.off()

#removing the data
rm(list=ls())