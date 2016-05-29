#Load Data

#setwd("C:/Users/lindec25/Johan/Study/Coursera/R/Exploratory Data Analysis/#1/exdata-data-household_power_consumption")

FileName="household_power_consumption.txt"
DataFile=read.csv(FileName,header=TRUE,na.strings="?",stringsAsFactors=FALSE,sep = ";")
DataFile$Date=as.Date(DataFile$Date, format="%d/%m/%Y")
DataFile=subset(DataFile, subset = (Date>="2007/02/01" & Date<="2007/02/02" ))

#Make Plots 
hist(DataFile$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
