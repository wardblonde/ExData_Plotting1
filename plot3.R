all_data <- read.csv("household_power_consumption.txt", sep = ";")
all_data[all_data == "?"] <- NA
all_data$Date <- as.Date(all_data$Date, "%d/%m/%Y")
explore_data <- subset(all_data, Date == "2007-02-01" | Date == "2007-02-02")
explore_data$Time <- strptime(paste(explore_data$Date, as.character(explore_data$Time)), "%Y-%m-%d %H:%M:%S")
GAP <- as.numeric(levels(explore_data$Global_active_power))[explore_data$Global_active_power]
Subm1 <- as.numeric(levels(explore_data$Sub_metering_1))[explore_data$Sub_metering_1]
Subm2 <- as.numeric(levels(explore_data$Sub_metering_2))[explore_data$Sub_metering_2]
Subm3 <- explore_data$Sub_metering_3
Subm3[is.na(Subm3)] <- 0
png("plot3.png")
plot(explore_data$Time, Subm1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(explore_data$Time, Subm2, xlab = "", col = "red")
lines(explore_data$Time, Subm3, xlab = "", col = "blue")
legend("topright", 
       lty = c(1,1), 
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
