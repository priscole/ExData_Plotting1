library(dplyr)

zipPath <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
temp <- tempfile()
download.file(zipPath,temp)
data <- read.table(unz(temp, "household_power_consumption.txt"), header=TRUE, sep = ";", na.strings = "?", stringsAsFactors = F)
unlink(temp)

datUpdate <- mutate(data, formatDate= as.Date(strptime(Date, format = "%d/%m/%Y")))
feb2007 <- filter(datUpdate, as.Date(formatDate)== "2007-02-01" | as.Date(formatDate)== "2007-02-02")

png('plot3.png')
s1 <- feb2007D$Sub_metering_1
s2 <- feb2007D$Sub_metering_2
s3 <- feb2007D$Sub_metering_3

plot(s1, type="n", ylab = "Energy sub metering", xlab="", xaxt = "n")
lines(s1)
lines(s2, col="red")
lines(s3, col="blue")
legend("topright", lwd = c(2.5,2.5,2.5), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
axis(1, at=xAxis, labels=c("Thu", "Fri", "Sat"))
dev.off()