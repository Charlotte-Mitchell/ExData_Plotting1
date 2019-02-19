## plot4.R <- load and create plot1 for the assignment

library(lubridate)

## load the data
elec_data <- read.delim("household_power_consumption.txt", header =TRUE, sep = ";", stringsAsFactors = FALSE)

## tidy the data
elec_data$Date <- dmy(elec_data$Date) # convert Date to Date format
elec_data$DateandTime <- paste(elec_data$Date, elec_data$Time) # make a date and time column
elec_data$DateandTime <- strptime(elec_data$DateandTime, "%Y-%m-%d %H:%M:%S") # convert to POSIXlt
elec_data[3:9] <- lapply(elec_data[3:9], as.numeric) # convert all other columns to numeric

## subset for the dates we want
time_period <- subset(elec_data, Date == "2007-02-01" | Date == "2007-02-02")

## open png device
png("plot4.png", width = 480, height = 480)

## make the plot required
par(mfcol=c(2,2), mar=c(4,4,1,1)) # set up for 4 plots

# plot top left <- plot 2 with amended ylab
plot(time_period$DateandTime, time_period$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")

# plot bottom left
plot(time_period$DateandTime, time_period$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(time_period$DateandTime, time_period$Sub_metering_2, col = "red")
lines(time_period$DateandTime, time_period$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd=1)

## plot top right
plot(time_period$DateandTime, time_period$Voltage, type = "l", ylab = "Voltage", xlab = "datetime", ylim = c(234,246))

## plot bottom right
plot(time_period$DateandTime, time_period$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime", ylim = c(0.0,0.5))


## close dev
dev.off()