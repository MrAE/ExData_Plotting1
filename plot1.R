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



png("plot1.png", height=480, width=480)
hist(sub$Global_ac, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()




#   Time: 30 minutes
##  Working status: Check. Creates the graph as desired.
### Comments:
####Soli Deo Gloria
