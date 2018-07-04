##read data

setwd("C:/Users/MB57864/Desktop/dscoursera/Exploratory Data Analysis")

hpc <- read.table("household_power_consumption.txt.", sep=";", header=FALSE, skip=grep("1/2/2007", readLines("household_power_consumption.txt.")), nrows=2880, col.names=c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##format date and time

hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")

hpc$Time <- strptime(hpc$Time, format = "%H:%M:%S")

##plot


png(filename="plot4.png", width=480, height=480)

par(mfrow=c(2,2))

##1

with(hpc, plot(Global_active_power, type="l", ylab="Global Active Power", xaxt="n", xlab=""))

axis(1, at=c(1, 1440, 2880), labels=c("Fri", "Thu", "Sat"))

##2

with(hpc, plot(Voltage, type="l", ylab="Voltage", xaxt="n", xlab="datetime"))

axis(1, at=c(1, 1440, 2880), labels=c("Fri", "Thu", "Sat"))

##3

with(hpc, plot(Sub_metering_1, type="l", ylab="Energy sub metering", xaxt="n", xlab=""))

lines(hpc$Sub_metering_2, type="l", col="red")
lines(hpc$Sub_metering_3, type="l", col="blue")

legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5)

axis(1, at=c(1, 1440, 2880), labels=c("Fri", "Thu", "Sat"))

##4

with(hpc, plot(Global_reactive_power, type="l", xaxt="n", xlab="datetime"))

axis(1, at=c(1, 1440, 2880), labels=c("Fri", "Thu", "Sat"))



dev.off()