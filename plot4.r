#Read Data from File
data <-"./Coursera/household_power_consumption.txt"
con <- read.table(file = data, stringsAsFactors = FALSE, header = TRUE, sep = ';')

#Convert The Date to Date format
con$Date <- as.Date(con$Date, "%d/%m/%Y")

#Subset the data
con <-subset(con, Date>= "2007-02-01" & Date <="2007-02-02")

#Convert data into numeric or else it will not be possible to plot it
con$Global_active_power<-as.numeric(con$Global_active_power)
con$Sub_metering_1<-as.numeric(con$Sub_metering_1)
con$Sub_metering_2<-as.numeric(con$Sub_metering_2)
con$Sub_metering_3<-as.numeric(con$Sub_metering_3)


#Strip Time and Date to a different variable
dtm <- strptime(paste(con4$Date, con4$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 

par(mfrow = c(2, 2)) 


#Plot the Data
plot(dtm, con$globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(dtm, con$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(dtm, con$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(dtm, con$Sub_metering_2, type="l", col="red")
lines(dtm, con$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(dtm, con$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")


#PNG file create
dev.copy(png, file="plot4.png", height=480, width=480)

dev.off()
