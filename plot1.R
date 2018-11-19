energy <- read.table("./exploratoryanalysisweek1/household_power_consumption.txt", sep=";", skip=66637, nrows=2880, header=FALSE, stringsAsFactors = FALSE)
colnm <- read.table("./exploratoryanalysisweek1/household_power_consumption.txt", sep=";", nrows=1, header=FALSE, as.is=TRUE)
colnames(energy) <- colnm[1,]
library(lubridate)
library(chron)
energy$Date <- dmy(energy$Date)
energy$Time <- chron(times=energy$Time)


png("./ExploratoryAnalysisWeek1/plot1.png")
hist(energy$Global_active_power, col="Red", xlab="Global Active Power (kilowatts)",
     main="Global Active Power")
dev.off()

