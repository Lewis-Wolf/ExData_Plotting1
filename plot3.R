#Read in the data#

household_power_consumption <- read.csv("C:/Users/drew/Desktop/datasciencecoursera-repo/household_power_consumption.txt", 
                                        sep=";", na.strings="?")
household_power_consumption$Date<- as.Date(household_power_consumption$Date,format="%d/%m/%Y")

#subsetting to the specified dates#

date_subset<-subset(household_power_consumption, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting dates

datetime <- paste(as.Date(date_subset$Date), date_subset$Time)
date_subset$Datetime <- as.POSIXct(datetime)

## Plot 3

with(date_subset, {
        plot(Sub_metering_1~Datetime, type="l",
             ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
