#Read Data from File
data <-"./Coursera/household_power_consumption.txt"
con <- read.table(file = data, stringsAsFactors = FALSE, header = TRUE, sep = ';')

#Convert The Date to Date format
con$Date <- as.Date(con$Date, "%d/%m/%Y")

#Subset the data
con <-subset(con, Date>= "2007-02-01" & Date <="2007-02-02")

#Convert data into numeric or else it will not be possible to plot it
con$Global_active_power<-as.numeric(con$Global_active_power)

#Plot the data
hist(con$Global_active_power, col ="red", main ="Global Active Power", xlab = "Global Active Power(killowatts)")

#Copy the data to png file
dev.copy(png, file="plot1.png", width =480, height =480)
dev.off()