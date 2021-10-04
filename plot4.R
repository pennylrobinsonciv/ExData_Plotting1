setwd("~/R/Exploratory Data Analysis/ Assignment 1 (EC)")

#install.packages("anytime") - use this code if package not installed
library(anytime) #- use this to access anytime function

datafile<-read.table("household_power_consumption.txt",header=FALSE,sep=";",skip=66637,nrows=2880,col.names = c("Date","Time","Global Active Power","Global Reactive Power","Voltage","Global Intensity","Sub metering 1","Sub metering 2","Sub metering 3"))

datafile$Date<-as.Date(datafile$Date,"%d/%m/%Y")

datafile$myday<-anytime(as.factor(paste(datafile$Date,datafile$Time)))

png("plot4.png")

par(mfrow=c(2,2),mar=c(4,4,4,1))

plot(datafile$myday,datafile$Global.Active.Power,type="l",xlab="Day",ylab="Global Active Power (kilowatt)" )

plot(datafile$myday,datafile$Voltage,type="l",xlab="Day",ylab="Voltage (volt)")

plot(datafile$myday,datafile$Sub.metering.1,type="l",xlab="Day",ylab="Energy sub metering (Watt-hr)")
lines(datafile$myday,datafile$Sub.metering.2,type="l",col="red")
lines(datafile$myday,datafile$Sub.metering.3,type="l",col="blue")
legend("topright",legend=c("Sub metering 1","Sub metering 2","Sub metering 3"),col=c("black","red","blue"),lty=1)

plot(datafile$myday,datafile$Global.Reactive.Power,type="l",xlab="Day",ylab="GLobal Reactive Power (kilowatt)" )
mtext("Electric Power Consumption Study from Feb 1 to Feb 2 2007",outer=TRUE)
dev.off()