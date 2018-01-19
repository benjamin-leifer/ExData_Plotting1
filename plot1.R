#import data
electricity <- read.table("household_power_consumption.txt", header=TRUE, sep=";",stringsAsFactors = FALSE, dec = '.')
#make figure
png('plot1.png',480,480)
#data of interest
elecInDates <- electricity[electricity$Date %in% c("1/2/2007","2/2/2007") ,]
#make plot
hist(as.numeric(elecInDates$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
#close figure
dev.off()