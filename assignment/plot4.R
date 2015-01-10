# R script to address Exploratory Data Analysis (exdata-010)assignment 1
# Reads data from 'household_power_consumption.txt' and produces a PNG graphic with several
# line charts various metrics for the days 2007-02-01 and 2007-02-02

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
vColorBlack <- "black"
vColorRed <- "red"
vColorBlue <- "blue"
vMain <-  ""
vSub <- ""
vXlab <- ""
vYlab <- ""

# Plot to PNG file
png(file="plot4.png", width=480, height=480)

# Enable 2x2 plots to be generated
par(mfrow=c(2,2))

# We use the same technique here as in plot2 and plot3

# The 'Global Active Power' chart
vYlab <- "Global Active Power"
vSub <- ""
plot(1:nrow(df.data), df.data$Global_active_power, type = "l", col = vColorBlack, main = vMain, xlab = vXlab, ylab = vYlab, sub = vSub, axes = FALSE)
axis(2)
axis(1, at = seq(from = 1, to = nrow(df.data), length.out = 3), labels = c("Thu", "Fri", "Sat"))
box(which = "plot")

# The 'Voltage' chart
vYlab <- "Voltage"
vSub <- "datetime"
plot(1:nrow(df.data), df.data$Voltage, type = "l", col = vColorBlack, main = vMain, xlab = vXlab, ylab = vYlab, sub = vSub, axes = FALSE)
axis(2)
axis(1, at = seq(from = 1, to = nrow(df.data), length.out = 3), labels = c("Thu", "Fri", "Sat"))
box(which = "plot")

# The 'Sub_metering_x' chart
vYlab <- "Energy sub metering"
vSub <- ""
plot(1:nrow(df.data), df.data$Sub_metering_1, type = "l", col = vColorBlack, main = vMain, xlab = vXlab, ylab = vYlab, sub = vSub, axes = FALSE)
lines(1:nrow(df.data), df.data$Sub_metering_2, type = "l", col = vColorRed)
lines(1:nrow(df.data), df.data$Sub_metering_3, type = "l", col = vColorBlue)
axis(2)
axis(1, at = seq(from = 1, to = nrow(df.data), length.out = 3), labels = c("Thu", "Fri", "Sat"))
box(which = "plot")

# Add the legend - the bty = "n" option turns OFF the border around the legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1, col = c(vColorBlack, vColorRed, vColorBlue), bty = "n")


# The 'Global Reactive Power' chart
vYlab <- "Global_reactive_power"
vSub <- "datetime"
plot(1:nrow(df.data), df.data$Global_reactive_power, type = "l", col = vColorBlack, main = vMain, xlab = vXlab, ylab = vYlab, sub = vSub, axes = FALSE)
axis(2)
axis(1, at = seq(from = 1, to = nrow(df.data), length.out = 3), labels = c("Thu", "Fri", "Sat"))
box(which = "plot")

dev.off()
message("Plot saved as plot4.png")
