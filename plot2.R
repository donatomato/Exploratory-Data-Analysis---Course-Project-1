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
plot(data$Global_active_power~data$datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

##Save to PNG format
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()