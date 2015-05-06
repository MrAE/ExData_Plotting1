###
### Coursera: Exploratory Data Analysis
###
### Jesse Leigh Patsolic 
### 2015 <studiojlp@gmail.com>
### S.D.G 
#
#! /usr/bin/R

## Read in the data
hpc <- read.csv("household_power_consumption.txt", 
                sep=";", 
                na.strings="?", 
                skip=66600, 
                nrows=4000)

## Read in column names
cn <- colnames(read.csv("household_power_consumption.txt", 
                        sep=";", 
                        nrows=2))

## set column names
colnames(hpc) <- cn

## Subset data 
sub <- hpc[hpc$Date <= as.Date("2007-02-02") & 
           hpc$Date >= as.Date("2007-02-01"),]

## Format the date and time columns 
sub$Date <- as.Date(sub$Date, format="%d/%m/%Y")
sub$Time <- strptime(paste(sub$Date,sub$Time, sep=" "), 
                     format="%Y-%m-%d %H:%M:%S")


## initialize plotting device with 
## height and width as instructed
png("plot4.png", height=480, width=480)

## Set plotting window as a 2X2 grid 
par(mfcol=c(2,2))

plot(sub$Time, sub$Global_ac, 
     type="l", xlab="", 
     ylab="Global Active Power (kilowatts)")

plot(sub$Time, sub$Sub_metering_1, 
     type="l", xlab="", 
     ylab="Energy sub metering")

lines(sub$Time, sub$Sub_metering_2, col="red")
lines(sub$Time, sub$Sub_metering_3, col="blue")
legend("topright", legend=grep("Sub",colnames(sub),value=T), 
       col=c(1,2,"blue"), lty=1)

plot(sub$Time, sub$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(sub$Time, sub$Global_reac, type="l", 
     xlab="datetime", 
     ylab="Global_reactive_ppower")

## Close plotting device.
dev.off()


#   Time: 10 minutes
##  Working status:  Check. 
### Comments:
####Soli Deo Gloria
