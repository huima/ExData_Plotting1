setwd("/Users/huima/datascience/exploratorydataanalysis/project1")
data <- read.csv("household_power_consumption.txt", sep=";",header=TRUE,stringsAsFactors=FALSE)

asDate <- as.Date(data$Date, format="%d/%m/%Y")
data$AsDate <- asDate

subdata <- subset(data, data$AsDate > as.Date("2007-01-31", format="%Y-%m-%d") & data$AsDate < as.Date("2007-02-03", format="%Y-%m-%d") )

subdata$Global_active_power <- as.numeric(subdata$Global_active_power) 

subdata$dtString <- paste(subdata$Date,subdata$Time)
subdata$DateTime <- strptime(subdata$dtString, format="%d/%m/%Y %H:%M:%S")

subdata$Sub_metering_1 <- as.numeric(subdata$Sub_metering_1) 
subdata$Sub_metering_2 <- as.numeric(subdata$Sub_metering_2) 
subdata$Sub_metering_3 <- as.numeric(subdata$Sub_metering_3) 

subdata$Voltage <- as.numeric(subdata$Voltage) 
subdata$Global_reactive_power <- as.numeric(subdata$Global_reactive_power) 

png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

plot(subdata$DateTime,subdata$Global_active_power,type='l', ylab = 'Global Active Power', xlab = '')

plot(subdata$DateTime,subdata$Voltage,type='l', ylab = 'Voltage', xlab = 'datetime')

plot(subdata$DateTime,subdata$Sub_metering_1 ,type='l', ylab = 'Energy sub metering', xlab = '')

lines(subdata$DateTime,subdata$Sub_metering_2 ,type='l', col=rgb(1,0,0))
lines(subdata$DateTime,subdata$Sub_metering_3 ,type='l', col=rgb(0,0,1))

leg.txt <- c("Sub_metering_1", "Sub_metering_2",
             "Sub_metering_3")

legend("topright", legend = leg.txt, lty=c(1,1,1), lwd=c(1,1,1),col=c("black","red", "blue"), bty = "n") 

plot(subdata$DateTime,subdata$Global_reactive_power,type='l', ylab = 'Global_reactive_power', xlab = 'datetime')

dev.off()