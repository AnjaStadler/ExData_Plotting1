# read data
data <- read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings="?")

# convert date column from factor to date
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# select subset of data from 2007-02-01 to 2007-02-02
datasubset <- filter(data, Date == "2007-02-01" | Date == "2007-02-02")

# merge date and time
datasubset$datetime <- as.POSIXct(paste(datasubset$Date, datasubset$Time), format = "%Y-%m-%d %H:%M:%S")

# save plot as png
png(file="figure/plot4.png", width=480, height=480, units="px")

# four figures arranged in two rows and two columns
par(mfrow=c(2,2))

# set x-axis ticks to english
Sys.setlocale("LC_TIME", "en_US")

# subplot 1
plot(datasubset$datetime, datasubset$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")

# subplot 2
plot(datasubset$datetime, datasubset$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

# subplot 3
plot(datasubset$datetime, datasubset$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(datasubset$datetime, datasubset$Sub_metering_2, type = "l", col = "red")
lines(datasubset$datetime, datasubset$Sub_metering_3, type = "l", col = "blue")

# create legend
legend("topright",
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1),
       col=c("black","red","blue"),
       bty = "n")

# subplot 4
plot(datasubset$datetime, datasubset$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")


dev.off()

