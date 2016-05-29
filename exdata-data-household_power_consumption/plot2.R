#Load Data

#setwd("C:/Users/lindec25/Johan/Study/Coursera/R/Exploratory Data Analysis/#1/exdata-data-household_power_consumption")

FileName="household_power_consumption.txt"
DataFile=read.csv(FileName,header=TRUE,na.strings="?",stringsAsFactors=FALSE,sep = ";")
DataFile$Date=as.Date(DataFile$Date, format="%d/%m/%Y")
DataFile=subset(DataFile, subset = (Date>="2007/02/01" & Date<="2007/02/02" ))

dateTime=paste(as.Date(DataFile$Date),DataFile$Time)
DataFile$DateTime=as.POSIXct(dateTime)

#Make Plots 


plot(DataFile$Global_active_power~DataFile$DateTime, ylab="Global Active Power (kilowatts)", xlab="", type="l")

dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()