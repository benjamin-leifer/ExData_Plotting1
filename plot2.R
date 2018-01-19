#import data
electricity <- read.table("household_power_consumption.txt", header=TRUE, sep=";",stringsAsFactors = FALSE, dec = '.')

#make figure
png('plot2.png',480,480)

#data of interest
elecInDates <- electricity[electricity$Date %in% c("1/2/2007","2/2/2007") ,]

#get Complete dates
datetime <- strptime(paste(elecInDates$Date, elecInDates$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#make plot
with(elecInDates, plot(datetime, as.numeric(Global_active_power),type = 'l' , ylab='Global Active Power (kilowatts)',xlab = ''))

#close figure
dev.off()
