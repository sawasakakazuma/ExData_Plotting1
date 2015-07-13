x <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
x$Date <- as.Date(x$Date, format="%d/%m/%Y")
x$Global_active_power <- as.numeric(levels(x$Global_active_power))[x$Global_active_power]
y <- x[(x$Date=="2007-02-01") | (x$Date=="2007-02-02"),]

png(filename="plot2.png", width=480, height=480)
plot(y$Global_active_power, type="l", xaxt="n", xlab="", ylab="Global Active Power (kilowatts)")
axis(1, at=c(1,1441, 2881), labels=c("Thu","Fri","Sat"))
dev.off()
