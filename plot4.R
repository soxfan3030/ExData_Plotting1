###This script creates a 2x2 plot of four charts from a subset of the Electric 
###Power Consumption data set (2/1/07 & 2/2/07)

###reading in and cleaning up the data
###(wasn't sure if this needed to be included for the assignment, 
###but included it anyways)

data <-read.csv(file.choose(), header=TRUE, sep=";", colClass=)

data$Date <-as.Date(data$Date)

data1 <-subset(data, Date=='2007-02-01')

data2 <-subset(data, Date=='2007-02-02')

data3 <-rbind(data1, data2)

data3$Global_active_power <-as.character(data3$Global_active_power)

data3$Global_active_power <-as.numeric(data3$Global_active_power)

##create a date_time from the date and time columns
data3$date_time <-paste(data3$Date, data3$Time, sep=" ")

data3$date_time <-as.POSIXct(data3$date_time)


###data was read in as factors, transform to numeric
data3$Sub_metering_1 <-as.character(data3$Sub_metering_1)

data3$Sub_metering_1 <-as.numeric(data3$Sub_metering_1)

data3$Sub_metering_2 <-as.character(data3$Sub_metering_2)

data3$Sub_metering_2 <-as.numeric(data3$Sub_metering_2)

data3$Sub_metering_3 <-as.character(data3$Sub_metering_3)

data3$Sub_metering_3 <-as.numeric(data3$Sub_metering_3)

data3$Voltage <- as.character(data3$Voltage)

data3$Voltage <- as.numeric(data3$Voltage)

data3$Global_reactive_power <-as.character(data3$Global_reactive_power)

data3$Global_reactive_power <-as.numeric(data3$Global_reactive_power)

####Create plot

png('./ExData_Plotting1/plot4.png')

#create 2x2 to plot in
par(mfrow=c(2,2))

#first plot (Global Active Power over time)
with(data3, plot(Global_active_power~date_time, type='n', 
                 xlab="", ylab="Global Active Power (kilowatts)")) 
lines(data3$Global_active_power~data3$date_time)

#second plot (Voltage over time)
with(data3, plot(Voltage~date_time, type="n", xlab="datetime"))
lines(data3$Voltage~data3$date_time)

#third plot (Sub metering 1,2,3 over time)

with(data3, plot(Sub_metering_1~date_time, type='n', 
                 xlab="", ylab="Energy sub metering")) 
lines(data3$Sub_metering_1~data3$date_time)
lines(data3$Sub_metering_2~data3$date_time, col='red')
lines(data3$Sub_metering_3~data3$date_time, col='blue')
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1), lwd=c(2.5,2.5),col=c("black","blue","red"), bty = "n")

#fourth plot (Global reactive power over time)

with(data3, plot(Global_reactive_power~date_time, type='n', xlab='datetime'))
lines(data3$Global_reactive_power~data3$date_time)

dev.off()