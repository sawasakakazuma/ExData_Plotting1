x <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
x$Date <- as.Date(x$Date, format="%d/%m/%Y")
x$Global_active_power <- as.numeric(levels(x$Global_active_power))[x$Global_active_power]

y <- x[(x$Date=="2007-02-01") | (x$Date=="2007-02-02"),]
png(filename="plot1.png", width=480, height=480)
hist(y$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()
