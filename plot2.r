mydf<-read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)

mydf2<-subset(mydf,Date=="1/2/2007"|Date=="2/2/2007")
mydf2$DateTime<-paste(mydf2$Date,mydf2$Time, sep=" ")
mydf2$DateTime<-strptime(mydf2$DateTime,format="%d/%m/%Y %H:%M:%S")


with(mydf2,plot(DateTime,Global_active_power, type="l",xlab="", ylab="Global Active Power (kilowatts)"))
dev.copy(png,file="plot2.png")
dev.off()