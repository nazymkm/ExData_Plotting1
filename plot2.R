##Loading the data
alldata <- read.table("./data/household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")

##Subsetting the data
data <- subset(alldata,Date=="1/2/2007" | Date=="2/2/2007")

##Converting "Date" and "Time" to Date/Time classes

data$Time <-as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")


##Plotting
plot(data$Time,data$Global_active_power, type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()