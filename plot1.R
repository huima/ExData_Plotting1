Sys.setlocale("LC_MESSAGES", 'en_GB.UTF-8')
Sys.setenv(LANG = "en_US.UTF-8")
setwd("/Users/huima/datascience/exploratorydataanalysis/project1")
data <- read.csv("household_power_consumption.txt", sep=";",header=TRUE,stringsAsFactors=FALSE)

asDate <- as.Date(data$Date, format="%d/%m/%Y")
data$AsDate <- asDate

subdata <- subset(data, data$AsDate > as.Date("2007-01-31", format="%Y-%m-%d") & data$AsDate < as.Date("2007-02-03", format="%Y-%m-%d") )

subdata$Global_active_power <- as.numeric(subdata$Global_active_power) 

png("plot1.png", width=480, height=480)

hist(subdata$Global_active_power, col=rgb(1,0,0), main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)')

dev.off() 