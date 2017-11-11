framedata <- "./household_power_consumption.txt"
data <- read.table(framedata, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetD<- data[data$Date %in% c("1/2/2007","2/2/2007"),]

datetime <- strptime(paste(subSetD$Date, subSetD$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(subSetD$Global_active_power)
subMetering1 <- as.numeric(subSetD$Sub_metering_1)
subMetering2 <- as.numeric(subSetD$Sub_metering_2)
subMetering3 <- as.numeric(subSetD$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l",col="black",xlab="", ylab="Energy Submetering")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))
dev.off()
