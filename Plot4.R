library(data.table)
fileurl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if(!file.exists("household_power_consumption.txt"))
{download.file(fileurl,destfile="./EPC.zip")
  unzip(zipfile = "./EPC.zip")
}
hh<-fread("household_power_consumption.txt",sep="auto", header=TRUE, nrows=24*60*50)
date2<-paste(hh$Date,hh$Time)
date_time<-strptime(date2, "%d/%m/%Y %H:%M:%S")
hh<-cbind(hh,date_time)
j<-subset(hh,(date_time>="2007-02-01")&(date_time<"2007-02-03"))

png(filename = "Plot4.png",width = 480, height = 480, units = "px")

par(mfrow = c(2, 2))
plot(j$date_time, j$Global_active_power, type='l',ylab="Global Active Power", xlab="" )
plot(j$date_time, j$Voltage, type='l',ylab="Voltage", xlab="datetime" )
plot(j$date_time, j$Sub_metering_1, type='l',ylab="Energy sub metering", xlab="" )
lines(j$date_time, j$Sub_metering_2, col='red')
lines(j$date_time, j$Sub_metering_3, col='blue' )
legend("topright", pch = "-", col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
plot(j$date_time, j$Global_reactive_power, type='l',xlab="datetime", ylab="Global_reactive_power")

dev.off()