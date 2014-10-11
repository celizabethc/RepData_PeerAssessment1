
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
Sub_metering_1<-as.numeric(as.character(d2[,7]))
Sub_metering_2<-as.numeric(as.character(d2[,8]))
Sub_metering_3<-as.numeric(as.character(d2[,9]))


##set up 4 plots
png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

##top left

plot(dt1,Global_active_power, xaxt='n',yaxt='n',col="white",
     ylab="Global Active Power (kilowatts)",xlab="")

lines(dt1, Global_active_power, lwd=1.5) 


ylab<-c(0,2,4,6)
xlab<-c("Thurs","Fri","Sat")

##X axis lable for the day of week

axis.POSIXct(side=1, dt1, format="%a", labels = TRUE, )

##Y axis lable
axis(side = 2, at= c(0,2,4,6), labels=ylab)

##top right


plot(dt1,Voltage,xaxt='n',yaxt='n',
     ylab="Voltage",xlab="datetime", col="white")

lines(dt1, Voltage, lwd=1.5,ylab="") 

ylab<-c(234,238,242,246)

axis.POSIXct(side=1, dt1, format="%a", labels = TRUE)
axis(side = 2, at= c(800,1200,1600,2000), labels=ylab)

## Bottom Left

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

legend("topright",bty = "n", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),lwd=c(2.5,2.5,2.5),
       col=c("black","red", "blue"), pt.cex=1, cex=1)





##Bottom Right

plot(dt1,Global_reactive_power,xaxt='n',yaxt='n',ylab="Global_reactive_power",xlab="datetime",col="white")

lines(dt1, Global_reactive_power, lwd=1.5,ylab="") 


##yaxis
axis(side = 2, at= c(0,45,90,135,180,225), cex.lab=0.05,labels=c(0,.1,.2,.3,.4,.5))

##x axis
axis.POSIXct(side=1, dt1, format="%a", labels = TRUE)








dev.off()


