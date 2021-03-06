energy <- read.table("./exploratoryanalysisweek1/household_power_consumption.txt", sep=";", skip=66637, nrows=2880, header=FALSE, stringsAsFactors = FALSE)
colnm <- read.table("./exploratoryanalysisweek1/household_power_consumption.txt", sep=";", nrows=1, header=FALSE, as.is=TRUE)
colnames(energy) <- colnm[1,]
library(lubridate)
library(chron)
energy$Date <- dmy(energy$Date)
energy$Time <- chron(times=energy$Time)

png("./ExploratoryAnalysisWeek1/plot3.png")
plot(energy$Time,energy$Sub_metering_1, type="l",
     ylab="Energy sub meeting", xaxt="n")
legend(x="topright",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("Black", "Red", "Blue"), lwd=2)
lines(energy$Time,energy$Sub_metering_2,type="l", col="Red")
lines(energy$Time,energy$Sub_metering_3,type="l", col="Blue")
axis(1,at=c(min(energy$Time), median(energy$Time), max(energy$Time)), labels=c("Thu", "Fri", "Sat"))
dev.off()
