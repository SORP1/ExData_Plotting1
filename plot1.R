##read data

setwd("C:/Users/MB57864/Desktop/dscoursera/Exploratory Data Analysis")

hpc <- read.table("household_power_consumption.txt.", sep=";", header=FALSE, skip=grep("1/2/2007", readLines("household_power_consumption.txt.")), nrows=2879, col.names=c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##format date and time

hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")

hpc$Time <- strptime(hpc$Time, format = "%H:%M:%S")

##plot

png(filename="plot1.png", width=480, height=480)

hist(hpc$Global_active_power, col="red", main= "Global Active Power", xlab="Global Active Power (kilowatts)", ylim=c(0, 1200 ))

dev.off()