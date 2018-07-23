##Read the dataset
##Convert the date variable
data <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

##Subset the data
##Convert the dates
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

##Create the plot
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

##Save to PNG format
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()