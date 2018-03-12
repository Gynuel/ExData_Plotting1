#Reading the data from 2007-02-01 and 2007-02-02
raw <- "household_power_consumption.txt"
data <- read.table(raw, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
testdata <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

#Plotting Graph Number 4
datetime <- strptime(paste(testdata$Date, testdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GlobalActivePower <- as.numeric(testdata$Global_active_power)
GlobalReactivePower <- as.numeric(testdata$Global_reactive_power)
Voltage <- as.numeric(testdata$Voltage)
SubMetering1 <- as.numeric(testdata$Sub_metering_1)
SubMetering2 <- as.numeric(testdata$Sub_metering_2)
SubMetering3 <- as.numeric(testdata$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power")
plot(datetime, Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, SubMetering1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, SubMetering2, type="l", col="red")
lines(datetime, SubMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1, lwd=1,col=c("black", "red", "blue"),bty="n")
plot(datetime, GlobalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
