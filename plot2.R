all_data <- read.csv("household_power_consumption.txt", sep = ";")
all_data[all_data == "?"] <- NA
all_data$Date <- as.Date(all_data$Date, "%d/%m/%Y")
explore_data <- subset(all_data, Date == "2007-02-01" | Date == "2007-02-02")
explore_data$Time <- strptime(paste(explore_data$Date, as.character(explore_data$Time)), "%Y-%m-%d %H:%M:%S")
GAP <- as.numeric(levels(explore_data$Global_active_power))[explore_data$Global_active_power]
png("plot2.png")
plot(explore_data$Time, GAP, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
