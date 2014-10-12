## plot 2 R script

## load needed libraries
library("sqldf")


## txt file already downloaded and unzipped in ./data directory


## using SQL to only read data from 2/1/2007 to 2/2/2007
dat <- read.csv.sql("./data/household_power_consumption.txt", sql = "SELECT * from file WHERE Date in ('1/2/2007','2/2/2007') ", sep = ";", header = TRUE)

dat$TD <- strptime(paste(dat$Date, dat$Time, sep=","), format="%d/%m/%Y,%H:%M:%S")

plot(dat$TD, dat$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")

dev.copy(png, file = "plot2.png")  ## Copy my plot to a PNG file 
dev.off()  ## close the PNG device
