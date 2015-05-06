###
### Coursera: Exploratory Data Analysis
###
### Jesse Leigh Patsolic 
### 2015 <studiojlp@gmail.com>
### S.D.G 
#
#! /usr/bin/R

hpc <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", skip=66600, nrows=4000)

cn <- colnames(read.csv("household_power_consumption.txt", sep=";", nrows=2))

colnames(hpc) <- cn

hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")
hpc$Time <- strptime(paste(hpc$Date,hpc$Time, sep=" "), 
                     format="%Y-%m-%d %H:%M:%S")

sub <- hpc[hpc$Date <= as.Date("2007-02-02") & 
           hpc$Date >= as.Date("2007-02-01"),]


png("plot4.png", height=480, width=480)
par(mfcol=c(2,2))

plot(sub$Time, sub$Global_ac, type="l", xlab="", ylab="Global Active Power (kilowatts)")

plot(sub$Time, sub$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(sub$Time, sub$Sub_metering_2, col="red")
lines(sub$Time, sub$Sub_metering_3, col="blue")
legend("topright", legend=grep("Sub",colnames(sub),value=T), col=c(1,2,"blue"), lty=1)

plot(sub$Time, sub$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(sub$Time, sub$Global_reac, type="l", xlab="datetime", ylab="Global_reactive_ppower")

dev.off()




#   Time: 
##  Working status: 
### Comments:
####Soli Deo Gloria
