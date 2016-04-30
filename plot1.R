##Loading the data
alldata <- read.table("./household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")

##Subsetting the data
data <- subset(alldata,Date=="1/2/2007" | Date=="2/2/2007")

##Converting "Date" and "Time" to Date/Time classes
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- strptime(data$Time, format="%H:%M:%S")

##Plotting
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.copy(png, file="plot1.png", bg="white", width=480, height=480)
dev.off()