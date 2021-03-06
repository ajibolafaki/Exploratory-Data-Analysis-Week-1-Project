df <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, dec=".")
sub_df <- df[df$Date %in% c("1/2/2007","2/2/2007"), ]
sub_df$date_time <- strptime(paste(sub_df$Date, sub_df$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#convert columns to numeric
df[c(3:7)] <- lapply(df[c(3:7)], function(x) {as.numeric(x)})

#plot2.png
png("plot2.png", width=480, height=480)
plot(sub_df$date_time, sub_df$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()