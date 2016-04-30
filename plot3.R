##Loading the data
alldata <- read.table("./household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")

##Subsetting the data
data <- subset(alldata,Date=="1/2/2007" | Date=="2/2/2007")

##Converting "Date" and "Time" to Date/Time classes

data$Time <-as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")


##Plotting
plot(data$Time,data$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(data$Time,data$Sub_metering_2, col="red")
lines(data$Time,data$Sub_metering_3, col="blue")

##Adding a legend
legend("topright",lty=1,col=c("black","red","blue"),cex=0.8,legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file="plot3.png", bg="white",width=480, height=480)
dev.off()