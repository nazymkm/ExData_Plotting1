##Loading the data
alldata <- read.table("./household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")

##Subsetting the data
data <- subset(alldata,Date=="1/2/2007" | Date=="2/2/2007")

##Converting "Date" and "Time" to Date/Time classes

data$Time <-as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")


##Plotting
par(mfcol=c(2,2)) ##plots are filled column-wise

##1st plot
plot(data$Time,data$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")

##2nd plot (down)
plot(data$Time,data$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(data$Time,data$Sub_metering_2, col="red")
lines(data$Time,data$Sub_metering_3, col="blue")
legend("topright",bty="n",cex=0.7,lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##3rd plot (to the left)
plot(data$Time,data$Voltage,type="l",ylab="Voltage",xlab="datetime")

##Last plot
plot(data$Time,data$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")

dev.copy(png, file="plot4.png",bg="white", width=480, height=480)
dev.off()