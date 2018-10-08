#read in dataset and subset for days of interest
power<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
library(lubridate)
power$Date<-dmy(power$Date)
power2<-subset(power,Date=='2007-02-01'|Date=='2007-02-02')

#combine data and time into one variable
Times<-with(power2,ymd(Date)+hms(Time))

#convert to numeric
Global_active_power<-as.character(power2$Global_active_power)
Global_active_power<-as.numeric(Global_active_power)
power2$Global_active_power<-Global_active_power

png("plot2.png")
#make plot
plot(Times,power2$Global_active_power,
     type="l",
     ylab="Global Active Power (kilowatts)",xlab="")
dev.off()