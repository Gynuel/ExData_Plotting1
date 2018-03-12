#Reading the data from 2007-02-01 and 2007-02-02
raw <- "household_power_consumption.txt"
data <- read.table(raw, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
testdata <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

#Plotting Graph Number 2
datetime <- strptime(paste(testdata$Date, testdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GlobalActivePower <- as.numeric(testdata$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, GlobalActivePower, type="1", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()