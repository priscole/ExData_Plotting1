library(dplyr)

zipPath <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
temp <- tempfile()
download.file(zipPath,temp)
data <- read.table(unz(temp, "household_power_consumption.txt"), header=TRUE, sep = ";", na.strings = "?", stringsAsFactors = F)
unlink(temp)

datUpdate <- mutate(data, formatDate= as.Date(strptime(Date, format = "%d/%m/%Y")))
feb2007 <- filter(datUpdate, as.Date(formatDate)== "2007-02-01" | as.Date(formatDate)== "2007-02-02")

png('plot2.png')
with(feb2007, plot(Global_active_power, type = "n", xlab="", ylab = "Global Active Power (kilowatts)", xaxt = "n"))
with(feb2007, lines(Global_active_power))
axis(1, at=xAxis, labels=c("Thu", "Fri", "Sat"))
dev.off()
