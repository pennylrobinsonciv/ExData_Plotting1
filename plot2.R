setwd("~/R/Exploratory Data Analysis/ Assignment 1 (EC)")
#install.packages("anytime") - use this code if package not installed
#library(anytime) - use this to access anytime function

datafile<-read.table("household_power_consumption.txt",header=FALSE,sep=";",skip=66637,nrows=2880,col.names = c("Date","Time","Global Active Power","Global Reactive Power","Voltage","Global Intensity","Sub metering 1","Sub metering 2","Sub metering 3"))

datafile$Date<-as.Date(datafile$Date,"%d/%m/%Y")

datafile$myday<-anytime(as.factor(paste(datafile$Date,datafile$Time)))
png("plot2.png")

plot(datafile$myday,datafile$Global.Active.Power,type="l",main="Global Active Power during Feb 01-02, 2007",xlab="Day",ylab="Global Active Power (kilowatt)" )

dev.off()

