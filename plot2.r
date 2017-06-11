#Read Data from File
data <-"./Coursera/household_power_consumption.txt"
con <- read.table(file = data, stringsAsFactors = FALSE, header = TRUE, sep = ';')

#Convert The Date to Date format
con$Date <- as.Date(con$Date, "%d/%m/%Y")

#Subset the data
con <-subset(con, Date>= "2007-02-01" & Date <="2007-02-02")

#Convert data into numeric or else it will not be possible to plot it
con$Global_active_power<-as.numeric(con$Global_active_power)


#Strip Time and Date to a different variable
dtm <- strptime(paste(con4$Date, con4$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 

#Plot the Data
plot(dtm, con4$Global_active_power, type = "l", ylab ="Global Active Power(killowatts)", xlab = "")

#PNG file create
dev.copy(png, file="plot2.png", height=480, width=480)

dev.off()
