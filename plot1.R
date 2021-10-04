setwd("~/R/Exploratory Data Analysis/ Assignment 1 (EC)")

datafile<-read.table("household_power_consumption.txt",header=FALSE,sep=";",skip=66637,nrows=2880,col.names = c("Date","Time","Global Active Power","Global Reactive Power","Voltage","Global Intensity","Sub metering 1","Sub metering 2","Sub metering 3"))

datafile$Date<-as.Date(datafile$Date,"%m/%d/%Y")
datafile$myday<-as.POSIXct(paste(datafile$Date,datafile$Time))
#PNG plot
#x-axis Global Active Power - column 3
#y-axis Frequency 
png("plot1.png")
hist(datafile$Global_active_power,main="Global Active Power",xlab = "Global Active Power (kilowatt)", col="red")
#save plot as png file 480 x 480 pixels
dev.off()

