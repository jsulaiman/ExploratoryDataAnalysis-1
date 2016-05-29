#Load Data

#setwd("C:/Users/lindec25/Johan/Study/Coursera/R/Exploratory Data Analysis/#1/exdata-data-household_power_consumption")

FileName="household_power_consumption.txt"
DataFile=read.csv(FileName,header=TRUE,na.strings="?",stringsAsFactors=FALSE,sep = ";")
DataFile$Date=as.Date(DataFile$Date, format="%d/%m/%Y")
DataFile=subset(DataFile, subset = (Date>="2007/02/01" & Date<="2007/02/02" ))

dateTime=paste(as.Date(DataFile$Date),DataFile$Time)
DataFile$DateTime=as.POSIXct(dateTime)

par(mfrow=c(2,2),mar=c(4,4,2,1), oma=c(0,0,2,1))
#Make Plots 

#1st Plot
hist(DataFile$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

#2nd Plot
plot(DataFile$Global_active_power~DataFile$DateTime, ylab="Global Active Power (kilowatts)", xlab="", type="l")

#3rd Plot
plot(DataFile$Sub_metering_1~DataFile$DateTime, ylab="Energy Sub metering", xlab="", type="l")
lines(DataFile$Sub_metering_2~DataFile$DateTime,col="Red")
lines(DataFile$Sub_metering_3~DataFile$DateTime,col="Blue") 
legend("topright", legend=c("Sub_metering_1   ", "Sub_metering_2   ", "Sub_metering_3   "), col=c("Black", "Red", "Blue"), lty=1, lwd=2, cex = 0.7)

#4rd Plot
plot(DataFile$Global_reactive_power~DataFile$DateTime, type="l", ylab="Global Reactive Power", xlab="datetime")


dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()