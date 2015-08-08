all_data <- read.csv("household_power_consumption.txt", sep = ";")
all_data[all_data == "?"] <- NA
all_data$Date <- as.Date(all_data$Date, "%d/%m/%Y")
explore_data <- subset(all_data, Date == "2007-02-01" | Date == "2007-02-02")
GAP <- as.numeric(levels(explore_data$Global_active_power))[explore_data$Global_active_power]
png("plot1.png")
hist(GAP, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()
