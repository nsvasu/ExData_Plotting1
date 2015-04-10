full_data <- read.csv(file="household_power_consumption.txt", sep=";", na.strings="?",header=T)
sub_data <- full_data[full_data$Date == "1/2/2007" | full_data$Date == "2/2/2007", ]


dt <- paste(sub_data$Date, sub_data$Time)
sub_data$dt <- strptime(dt, "%d/%m/%Y %H:%M:%S")

plot(sub_data$dt, sub_data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot2.png", width = 480, height = 480, units = "px")
dev.off()