## plot1.R <- load and create plot1 for the assignment

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
png("plot1.png", width = 480, height = 480)

## make the plot required
hist(time_period$Global_active_power, col = "red", ylim = c(0,1200), main = "Global Active Power", xlab = "Global Active Power (kilowatts)")


## close dev
dev.off()



