## plot 4 R script

## load needed libraries
library("sqldf")

## txt file already downloaded and unzipped in ./data directory

## using SQL to only read data from 2/1/2007 to 2/2/2007
dat <- read.csv.sql("./data/household_power_consumption.txt", sql = "SELECT * from file WHERE Date in ('1/2/2007','2/2/2007') ", sep = ";", header = TRUE)

## create date and time scale
dat$TD <- strptime(paste(dat$Date, dat$Time, sep=","), format="%d/%m/%Y,%H:%M:%S")

png(file = "plot4.png")  ## open png device

## set par for 4 plots

par(mfrow = c(2, 2))

## upper left plot
  plot(dat$TD, dat$Global_active_power,type="l",ylab="Global Active Power",xlab="")

## upper right plot
plot(dat$TD, dat$Voltage,type="l",ylab="Voltage",xlab="datetime")

## lower left plot
  ## draw plot border and label axis, use sub_metering_1 for y-axis height
  with(dat, plot(TD,Sub_metering_1 ,ylab = "Energy sub metering",xlab="",type = "n")) 

  ## plot three lines in different colors
  with( dat,lines(TD, Sub_metering_1 , col = "black"))
  with( dat,lines(TD, Sub_metering_2 , col = "red"))
  with( dat,lines(TD, Sub_metering_3 , col = "blue"))

  ## plot legend without box
  legend("topright", lwd = 1, col = c("black","red", "blue"), bty = "n",legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

## lower right plot
plot(dat$TD, dat$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")

dev.off()  ## close the PNG device
