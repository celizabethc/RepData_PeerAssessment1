## Exploratory Data Analysis Project 1
## Plot 1 - Histogram of Global Active Power

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

##lable subset data variables
date<-(d2[,1])
time<-d2[,2]
Global_active_power<-as.numeric(as.character((d2[,3])))
Global_reactive_power<-ts(d2[,4])
Voltage<-ts(d2[,5])
Global_intensity<-ts(d2[,6])
Sub_metering_1<-as.numeric(as.character(d2[,7]))
Sub_metering_2<-as.numeric(as.character(d2[,8]))
Sub_metering_3<-as.numeric(as.character(d2[,9]))



##plot 1

##create png file
png("plot1.png", width=480, height=480)

##plot histogram
hist(Global_active_power,col="red",xlab="Global Active Power (kilowatts)",ylab="Frequency",
     main="Global Active Power")


dev.off()
