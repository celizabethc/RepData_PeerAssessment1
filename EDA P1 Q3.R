##read in full data set
d<-read.table("/household_power_consumption 2.txt",header = TRUE, sep = ";")

date<-d[,1]
time<-d[,2]
Global_active_power<-d[,3]
Global_reactive_power<-d[,4]
Voltage<-d[,5]
Global_intensity<-d[,6]
Sub_metering_1<-d[,7]
Sub_metering_2<-d[,8]
Sub_metering_3<-d[,9]

##subset full data set based off of date
d2 <- d[ which(date=='2/2/2007'|date=='1/2/2007'), ]

date<-(d2[,1])
time<-d2[,2]

##concat date & time
dt<-paste(date,time)

##format as date
dt1<-strptime(dt,format="%d/%m/%Y %H:%M:%S")

Global_active_power<-ts(as.numeric(as.character((d2[,3]))))
Global_reactive_power<-ts(d2[,4])
Voltage<-ts(d2[,5])
Global_intensity<-ts(d2[,6])
Sub_metering_1<-ts(as.numeric(as.character(d2[,7])))
Sub_metering_2<-ts(as.numeric(as.character(d2[,8])))
Sub_metering_3<-ts(as.numeric(as.character(d2[,9])))


##Plot 3

png("plot3.png", width=480, height=480)


plot(dt1,Sub_metering_1, xaxt='n',yaxt='n',col="white",
     ylab="Energy Submetering",xlab="")


##Add Submetering 1 in black

lines(dt1, Sub_metering_1, col="black") 

##Add Submetering 2 in red
lines(dt1,Sub_metering_2/1.5,col="red")

##Add Submetering 3 in blue
lines(dt1,Sub_metering_3,col="blue")

##X axis lable for the day of week

axis.POSIXct(side=1, dt1, format="%a", labels = TRUE)

##Y axis

ylab<-c(0,10,20,30)
axis(side = 2, at= c(0,10,20,30), labels=ylab)


##Add legend for colors for variables

legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),lwd=c(2.5,2.5,2.5),
       col=c("black","red", "blue"), pt.cex=1, cex=0.75)

dev.off()
