library(data.table)

# Set working directory (corrected backslashes)
setwd("C:/Users/Swayam/Documents/ExData_Plotting1") 

# Read data from file, handling missing values
powerDT <- fread(input = "household_power_consumption.txt", na.strings = "?")

# Convert Global_active_power to numeric
powerDT[, Global_active_power := as.numeric(Global_active_power)]

# Convert Date column to Date type
powerDT[, Date := as.Date(Date, format = "%d/%m/%Y")]

# Filter data for the specified dates
powerDT <- powerDT[Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02")]

# Create a PNG file for the plot
png("plot1.png", width = 480, height = 480)

# Plot histogram
hist(powerDT$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")

# Close the graphical device
dev.off()

