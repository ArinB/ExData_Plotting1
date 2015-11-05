## Project 1 - Power Data Visualization
#

# Assign readable Column Names. Will use the Time Column as Datetime column later on. Hence changed the Time to Datetime as column name
colnames <- c("date","datetime","active_power","reactive_power","voltage","intensity","submeter1","submeter2","submeter3")

# Map proper Column CLasses
colclass <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")

# Read in just the data for 1/2/2007 and 2/2/2007. Replace "?" for "NA" in the data
powerdata <- read.table("./data/household_power_consumption.txt", sep = ";", skip = 66636, nrows = 2880, col.names = colnames, colClasses = colclass, header = TRUE, na.strings = "?")

powerdata$datetime <- paste(powerdata$date,powerdata$datetime)
powerdata$date <- strptime(powerdata$date, "%d/%m/%Y")
powerdata$datetime <- strptime(powerdata$datetime, "%d/%m/%Y %H:%M:%S")

#Change the date column to Day column
powerdata$date <- weekdays(powerdata$datetime, abbreviate = TRUE)
names(powerdata) <- c("day","datetime","active_power","reactive_power","voltage","intensity","submeter1","submeter2","submeter3")

# Data is now in the following format
# day            datetime active_power reactive_power voltage intensity submeter1 submeter2 submeter3
# Thu 2007-02-01 00:00:00        0.326          0.128  243.15       1.4         0         0         0
# Thu 2007-02-01 00:01:00        0.326          0.130  243.32       1.4         0         0         0
#
# Data formatting complete
# Visualization Stage Begins

# Plot 1
# This creates the Plot #1 in the working directory with file name = myplot_01.png

png(file = "plot1.png")
hist(powerdata$active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")
dev.off()
# End of Plot 01
