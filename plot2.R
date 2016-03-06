## Uploading the dataset into variable
data_full <- read.csv("C:/Users/farai/OneDrive/Documents/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
					  
# Date Conversion
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

# Subsetting the data based on the Date
data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_full)

# Date Conversion
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

# Plot 2
plot(data$Global_active_power~data$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

# Saving to png file
dev.copy(png, file="plot2.png", height=480, width=480)

dev.off()