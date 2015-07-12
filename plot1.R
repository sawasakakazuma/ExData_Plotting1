x <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
x$Date <- as.Date(x$Date, format="%d/%m/%Y")
y <- x[(x$Date=="2007-02-01") | (x$Date=="2007-02-02"),]
as.numeric(levels(y[,3]))[y[,3]]
y[,3] <- as.numeric(levels(y[,3]))[y[,3]]
png(filename="plot1.png", width=480, height=480)
hist(y[,3], col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()
