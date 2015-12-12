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

png(filename = "Plot1.png",width = 480, height = 480, units = "px")

hist(as.numeric(j$Global_active_power) , col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()
