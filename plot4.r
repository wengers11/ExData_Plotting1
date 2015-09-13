mydf<-read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)

mydf2<-subset(mydf,Date=="1/2/2007"|Date=="2/2/2007")
mydf2$DateTime<-paste(mydf2$Date,mydf2$Time, sep=" ")
mydf2$DateTime<-strptime(mydf2$DateTime,format="%d/%m/%Y %H:%M:%S")

par(mfcol=c(2,2))

with(mydf2,plot(DateTime,Global_active_power, type="l",xlab="", ylab="Global Active Power (kilowatts)"))

with(mydf2, plot(DateTime,Sub_metering_1,type="n", xlab="",ylab="Energy sub metering"))
with(mydf2, lines(DateTime, Sub_metering_1, col="black"))
with(mydf2, lines(DateTime, Sub_metering_2, col="red"))
with(mydf2, lines(DateTime, Sub_metering_3, col="blue"))
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1   ","Sub_metering_2   ","Sub_metering_3   "), cex=.2)

with(mydf2,plot(DateTime,Voltage,type="l",xlab="datetime",ylab="Voltage"))

with(mydf2,plot(DateTime,Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power"))

dev.copy(png,file="plot4.png")
dev.off()