#import data
electricity <- read.table("household_power_consumption.txt", header=TRUE, sep=";",stringsAsFactors = FALSE, dec = '.')

#make figure
png('plot4.png',480,480)

#data of interest
elecInDates <- electricity[electricity$Date %in% c("1/2/2007","2/2/2007") ,]

#get Complete dates
datetime <- strptime(paste(elecInDates$Date, elecInDates$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#make space for 4 plots
par(mfrow = c(2, 2))

#plot 1
with(elecInDates, plot(datetime, as.numeric(Global_active_power),type = 'l' , ylab='Global Active Power (kilowatts)',xlab = ''))

#plot 2
with(elecInDates, plot(datetime, as.numeric(Voltage),type = 'l' , ylab='Voltage',xlab = 'datetime'))

#plot 3
with(elecInDates, plot(datetime, as.numeric(Sub_metering_1),type = 'l' , ylab='Energy Submetering',xlab = ''))
with(elecInDates, lines(datetime, as.numeric(Sub_metering_2),type = 'l', col='red'))
with(elecInDates, lines(datetime, as.numeric(Sub_metering_3),type = 'l', col='blue'))
legend("topright",c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),lty = 1, lwd = 2.5, col = c('black','red','blue'))

#plot 4
with(elecInDates, plot(datetime, as.numeric(Global_reactive_power),type = 'l' , ylab='Global_reactive_power',xlab = 'datetime'))

#close plot
dev.off()