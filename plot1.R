library(dplyr)

zipPath <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
temp <- tempfile()
download.file(zipPath,temp)
data <- read.table(unz(temp, "household_power_consumption.txt"), header=TRUE, sep = ";", na.strings = "?", stringsAsFactors = F)
unlink(temp)

datUpdate <- mutate(data, formatDate= as.Date(strptime(Date, format = "%d/%m/%Y")))
feb2007 <- filter(datUpdate, as.Date(formatDate)== "2007-02-01" | as.Date(formatDate)== "2007-02-02")

#Plot 1
png('plot1.png')
with(feb2007, hist(Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))
dev.off()