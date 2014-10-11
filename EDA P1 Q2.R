## Exploratory Data Analysis Project 1
## Plot 2 - Line Graph

##read in full data set
d<-read.table("/household_power_consumption 2.txt",header = TRUE, sep = ";")

##lable variables

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

##lable variables
date<-d2[,1]
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

##create png file
png("plot2.png", width=480, height=480)

##set up plot
plot(dt1,Global_active_power, xaxt='n',yaxt='n',col="white",
     ylab="Global Active Power (kilowatts)",xlab="")

##plot variables
lines(dt1, Global_active_power, lwd=1.5) 


##X axis lable for the day of week
axis.POSIXct(side=1, dt1, format="%a", labels = TRUE, )

##Y axis lable
ylab<-c(0,2,4,6)
axis(side = 2, at= c(0,2,4,6), labels=ylab)

dev.off()
