x <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
x$Date <- as.Date(x$Date, format="%d/%m/%Y")
x[,3] <- as.numeric(levels(x[,3]))[x[,3]]
y <- x[(x[,1]=="2007-02-01") | (x[,1]=="2007-02-02"),]
png(filename="plot2.png", width=480, height=480)
plot(y[,3], type="l", xaxt="n", xlab="", ylab="Global Active Power (kilowatts)")
axis(1, at=c(1,1441, 2881), labels=c("Thu","Fri","Sat"))
dev.off()
