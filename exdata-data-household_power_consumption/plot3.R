#Load Data

#setwd("C:/Users/lindec25/Johan/Study/Coursera/R/Exploratory Data Analysis/#1/exdata-data-household_power_consumption")

FileName="household_power_consumption.txt"
DataFile=read.csv(FileName,header=TRUE,na.strings="?",stringsAsFactors=FALSE,sep = ";")
DataFile$Date=as.Date(DataFile$Date, format="%d/%m/%Y")
DataFile=subset(DataFile, subset = (Date>="2007/02/01" & Date<="2007/02/02" ))

dateTime=paste(as.Date(DataFile$Date),DataFile$Time)
DataFile$DateTime=as.POSIXct(dateTime)

#Make Plots 


plot(DataFile$Sub_metering_1~DataFile$DateTime, ylab="Energy Sub metering", xlab="", type="l")
lines(DataFile$Sub_metering_2~DataFile$DateTime,col="Red")
lines(DataFile$Sub_metering_3~DataFile$DateTime,col="Blue") 
legend("topright", legend=c("Sub_metering_1   ", "Sub_metering_2   ", "Sub_metering_3   "), col=c("Black", "Red", "Blue"), lty=1, lwd=2, cex = 0.7)

dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()