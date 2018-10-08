#read in data and subset for dates of interest
power<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
library(lubridate)
power$Date<-dmy(power$Date)
power2<-subset(power,Date=='2007-02-01'|Date=='2007-02-02')

#combine date and time into one variable
Times<-with(power2,ymd(Date)+hms(Time))

#convert sub metering variables into numeric
power3<-lapply(power2[7:9],as.character)
power3<-lapply(power3,as.numeric)
power2[7:9]<-power3

png("plot3.png")
#make plot with three lines
plot(Times,power2$Sub_metering_1,type="l",ylab="Energy/Sub metering",xlab="")
lines(Times,power2$Sub_metering_2,col='red')
lines(Times,power2$Sub_metering_3,col='blue')

#make legend
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lwd=2,col=c("black","red","blue"))

dev.off()