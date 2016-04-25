Step 1  Loading the data

data <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",data)
unzip(data)
myfile<-file("household_power_consumption.txt","r")
PowerData<- read.table(text = grep("^[1,2]/2/2007",readLines(myfile),value=TRUE), sep=";",na.strings="?")
unlink(data)
colnames(PowerData)<- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3" )


DateTime <-paste(PowerData$Date,PowerData$Time)
PowerData$DateTime <-strptime(DateTime, "%d/%m/%Y %H:%M:%S")

Making Plots

plot1<-hist(PowerData$Global_active_power, xlab="Global Active Power (kilowatts)",main="plot1",col="red",)
