## plot 1 R script

## load needed libraries
library("sqldf")

## txt file already downloaded and unzipped

## using SQL to only read data from 2/1/2007 to 2/2/2007
dat <- read.csv.sql("./data/household_power_consumption.txt", sql = "SELECT * from file WHERE Date in ('1/2/2007','2/2/2007') ", sep = ";", header = TRUE)

## plot histogram with labels
hist(dat$Global_active_power, main="Global Active Power",  xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.copy(png, file = "plot1.png")  ## Copy my plot to a PNG file 
dev.off()  ## close the PNG device
