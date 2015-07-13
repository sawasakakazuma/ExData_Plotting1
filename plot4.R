x <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
x$Date <- as.Date(x$Date, format="%d/%m/%Y")
x$Global_active_power <- as.numeric(levels(x$Global_active_power))[x$Global_active_power]
x$Sub_metering_1 <- as.numeric(levels(x$Sub_metering_1))[x$Sub_metering_1]
x$Sub_metering_2 <- as.numeric(levels(x$Sub_metering_2))[x$Sub_metering_2]
x$Voltage <- as.numeric((levels(x$Voltage)))[x$Voltage]
x$Global_reactive_power <- as.numeric((levels(x$Global_reactive_power)))[x$Global_reactive_power]
y <- x[(x$Date=="2007-02-01") | (x$Date=="2007-02-02"),]

png(filename="plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(y[,3], type="l", xaxt="n", xlab="", ylab="Global Active Power")
axis(1, at=c(1,1441, 2881), labels=c("Thu","Fri","Sat"))

plot(as.numeric(y[,5]), type="l", xaxt="n", xlab="datetime", ylab="Voltage", ylim=c(234,246))
axis(1, at=c(1,1441, 2881), labels=c("Thu","Fri","Sat"))

plot(y$Sub_metering_1, type="l", xaxt="n", xlab="", ylab="Energy sub metering", ylim=c(0,38))
par(new=T)
plot(y$Sub_metering_2, type="l", xaxt="n", yaxt="n", xlab="", ylab="", ylim=c(0,38), col="red")
par(new=T)
plot(y$Sub_metering_3, type="l", xaxt="n", yaxt="n", xlab="", ylab="", ylim=c(0,38), col="blue")
axis(1, at=c(1,1441,2881), labels=c("Thu","Fri","Sat"))
legend("topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(y$Global_reactive_power, type="l", xaxt="n", ylim=c(0,0.5), ylab="Global_reactive_power", xlab="datetime")
axis(1, at=c(1,1441, 2881), labels=c("Thu","Fri","Sat"))

dev.off()
