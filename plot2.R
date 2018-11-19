energy <- read.table("./exploratoryanalysisweek1/household_power_consumption.txt", sep=";", skip=66637, nrows=2880, header=FALSE, stringsAsFactors = FALSE)
colnm <- read.table("./exploratoryanalysisweek1/household_power_consumption.txt", sep=";", nrows=1, header=FALSE, as.is=TRUE)
colnames(energy) <- colnm[1,]
library(lubridate)
library(chron)
energy$Date <- dmy(energy$Date)
energy$Time <- chron(times=energy$Time)

png("./ExploratoryAnalysisWeek1/plot2.png")
plot(energy$Time,energy$Global_active_power, type="l",
     ylab="Global Active Power (kilowatts)", xaxt="n")
axis(1,at=c(min(energy$Time), median(energy$Time), max(energy$Time)), labels=c("Thu", "Fri", "Sat"))
dev.off()

