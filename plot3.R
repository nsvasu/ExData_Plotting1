full_data <- read.csv(file="household_power_consumption.txt", sep=";", na.strings="?",header=T)
sub_data <- full_data[full_data$Date == "1/2/2007" | full_data$Date == "2/2/2007", ]


dt <- paste(sub_data$Date, sub_data$Time)
sub_data$dt <- strptime(dt, "%d/%m/%Y %H:%M:%S")

plot(sub_data$dt, sub_data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy Sub Meering")
lines(sub_data$dt, sub_data$Sub_metering_2, col="red")
lines(sub_data$dt, sub_data$Sub_metering_3, col="blue")

legend("topright", legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"), col = c("black", "red", "blue"), lwd = 1)

dev.copy(png, file = "plot3.png", width = 480, height = 480, units = "px")
dev.off()