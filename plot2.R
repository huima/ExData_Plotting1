setwd("/Users/huima/datascience/exploratorydataanalysis/project1")
data <- read.csv("household_power_consumption.txt", sep=";",header=TRUE,stringsAsFactors=FALSE)

asDate <- as.Date(data$Date, format="%d/%m/%Y")
data$AsDate <- asDate

subdata <- subset(data, data$AsDate > as.Date("2007-01-31", format="%Y-%m-%d") & data$AsDate < as.Date("2007-02-03", format="%Y-%m-%d") )

subdata$Global_active_power <- as.numeric(subdata$Global_active_power) 

subdata$dtString <- paste(subdata$Date,subdata$Time)
subdata$DateTime <- strptime(subdata$dtString, format="%d/%m/%Y %H:%M:%S")

png("plot2.png", width=480, height=480)
plot(subdata$DateTime,subdata$Global_active_power,type='l', ylab = 'Global Active Power (kilowatts)', xlab = '')
dev.off()