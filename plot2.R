# install package dplyr
install.packages("dplyr")
 
# load libraries
library(dplyr)

# read data
data <- read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings="?")

# convert date column from factor to date
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# select subset of data from 2007-02-01 to 2007-02-02
datasubset <- filter(data, Date == "2007-02-01" | Date == "2007-02-02")

# merge date and time
datasubset$datetime <- as.POSIXct(paste(datasubset$Date, datasubset$Time), format = "%Y-%m-%d %H:%M:%S")

# save plot as png
png(file="figure/plot2.png", width=480, height=480, units="px")

# set x-axis ticks to english
Sys.setlocale("LC_TIME", "en_US")

# plot
plot(datasubset$datetime, datasubset$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

dev.off()


