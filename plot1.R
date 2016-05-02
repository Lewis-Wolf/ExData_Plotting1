#Read in the data#

household_power_consumption <- read.csv("C:/Users/drew/Desktop/datasciencecoursera-repo/household_power_consumption.txt", 
                                        sep=";", na.strings="?")
household_power_consumption$Date<- as.Date(household_power_consumption$Date,format="%d/%m/%Y")

#subsetting to the specified dates#

date_subset<-subset(household_power_consumption, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#Creating plot 1#

globalActivePower <- as.numeric(date_subset$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

