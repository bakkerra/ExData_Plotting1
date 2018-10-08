#read in data and subset for dates of interest
power<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
library(lubridate)
power$Date<-dmy(power$Date)
power2<-subset(power,Date=='2007-02-01'|Date=='2007-02-02')

#combine date and time into one variable
Times<-with(power2,ymd(Date)+hms(Time))

#convert numeric variables to numeric
data<-lapply(power2[3:9],as.character)
data<-lapply(data,as.numeric)
power2[3:9]<-data

png("plot4.png")
#set up sub-graphs
par(mfrow=c(2,2))

plot(Times,power2$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")

plot(Times,power2$Voltage, type="l",ylab="Voltage",xlab="")

plot(Times,power2$Sub_metering_1,type="l",ylab="Energy/Sub metering",xlab="")
lines(Times,power2$Sub_metering_2,col='red')
lines(Times,power2$Sub_metering_3,col='blue')
#make legend
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lwd=2,col=c("black","red","blue"))

plot(Times,power2$Global_reactive_power, type="l",xlab="datetime")

dev.off()