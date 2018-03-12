#Reading the data from 2007-02-01 and 2007-02-02
raw <- "household_power_consumption.txt"
data <- read.table(raw, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
testdata <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

#Plotting Graph Number 1
GlobalActivePower <- as.numeric(testdata$Global_active_power)
png("plot1.png", width=480, height=480)
hist(GlobalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()