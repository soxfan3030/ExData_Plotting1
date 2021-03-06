###This script creates a line plot of Global Active Power from a subset 
###of the Electric Power Consumption data set (2/1/07 & 2/2/07)

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

data3$date_time <-paste(data3$Date, data3$Time, sep=" ")

data3$date_time <-as.POSIXct(data3$date_time)

###Create the plot

png('./ExData_Plotting1/plot2.png')

with(data3, plot(Global_active_power~date_time, type='n', 
                 xlab="", ylab="Global Active Power (kilowatts)")) 
lines(data3$Global_active_power~data3$date_time)

dev.off()
