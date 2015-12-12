library(data.table)
fileurl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if(!file.exists("household_power_consumption.txt"))
{download.file(fileurl,destfile="./EPC.zip")
  unzip(zipfile = "./EPC.zip")
}
hh<-fread("household_power_consumption.txt",sep="auto", header=TRUE, nrows=24*60*50)
date2<-paste(hh$Date,hh$Time)
date3<-strptime(date2, "%d/%m/%Y %H:%M:%S")
hh<-cbind(hh,date3)
j<-subset(hh,(date3>="2007-02-01")&(date3<"2007-02-03"))

png(filename = "Plot2.png",width = 480, height = 480, units = "px")

plot(j$date3, j$Global_active_power, type='l',ylab="Global Active Power", xlab="" )

dev.off()