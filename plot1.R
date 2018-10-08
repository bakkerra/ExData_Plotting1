#read in dataset and subset for two days of interest
power<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
library(lubridate)
power$Date<-dmy(power$Date)
power2<-subset(power,Date=='2007-02-01'|Date=='2007-02-02')

#convert to numeric
Global_active_power<-as.character(power2$Global_active_power)
Global_active_power<-as.numeric(Global_active_power)
power2$Global_active_power<-Global_active_power

png("plot1.png")
#make histogram
hist(power2$Global_active_power,col='red',main="Global Active Power",
     xlab="Global Active Power (kilowatts)",ylab="Frequency",
     ylim=c(0,1200))
dev.off()

