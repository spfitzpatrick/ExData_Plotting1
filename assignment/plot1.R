# R script to address Exploratory Data Analysis (exdata-010)assignment 1
# Reads data from 'household_power_consumption.txt' and produces a PNG graphic
# (histogram) of 'Global Active Power' metric for the days 2007-02-01 and 2007-02-02

# Assumes that the raw data file (household_power_consumption.txt) is present in the current
# directory


# Read the data, limiting ourselves to the specified dates
vRequiredDates <- c("1/2/2007", "2/2/2007")

message("Reading data to plot ...")

df.data <- subset(read.csv("household_power_consumption.txt", 
                header = TRUE, 
                sep = ";", 
                dec = ".", 
                colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), 
                stringsAsFactors = FALSE, 
                na.strings = "?"), 
                (Date %in% vRequiredDates))

# Set up the parameters that we'll pass to the base plotting functions
vColor <- "red"
vMain <- "Global Active Power"
vXlab <- "Global Active Power (kilowatts)"
vYlab <- "Frequency"

# Make the plot
png(file="plot1.png", width=480, height=480)
hist(df.data$Global_active_power, col = vColor, main = vMain, xlab = vXlab, ylab = vYlab)
dev.off()
message("Plot saved as plot1.png")
