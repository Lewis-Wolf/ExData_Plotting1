#Read in the data#

household_power_consumption <- read.csv("C:/Users/drew/Desktop/datasciencecoursera-repo/household_power_consumption.txt", 
                                        sep=";", na.strings="?")
household_power_consumption$Date<- as.Date(household_power_consumption$Date,format="%d/%m/%Y")

#subsetting to the specified dates#

date_subset<-subset(household_power_consumption, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting dates

datetime <- paste(as.Date(date_subset$Date), date_subset$Time)
date_subset$Datetime <- as.POSIXct(datetime)


## Plot 2

plot(date_subset$Global_active_power~date_subset$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()