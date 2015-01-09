#load libraries
library(dplyr)

# read data
data <- read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings="?")

# convert date column from factor to date
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# select subset of data from 2007-02-01 to 2007-02-02
datasubset <- filter(data, Date == "2007-02-01" | Date == "2007-02-02")

# save plot as png
png(file="figure/plot1.png", width=480, height=480, units="px")

# plot
hist(datasubset$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")

dev.off()