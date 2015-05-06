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
png("plot2.png", height=480, width=480)

plot(sub$Time, sub$Global_ac, type="l", xlab="", ylab="Global Active Power (kilowatts)")

## close plotting device
dev.off()


#   Time: 5 minutes
##  Working status: Check. Creates the graph as desired.
### Comments:
####Soli Deo Gloria
