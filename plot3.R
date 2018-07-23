##Read the dataset
##Convert the date variable
data <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

##Subset the data
##Convert the dates
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
data$datetime <- as.POSIXct(data$datetime)

##Create the plot
with(data, {
plot(Sub_metering_1 ~ datetime, type = "l", 
     ylab = "Energy sub metering", xlab = "")
lines(Sub_metering_2 ~ datetime, col = "Red")
lines(Sub_metering_3 ~ datetime, col = "Blue")
})

legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


##Save to PNG Format
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()