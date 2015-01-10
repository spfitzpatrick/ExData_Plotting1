# R script to address Exploratory Data Analysis (exdata-010)assignment 1
# Reads data from 'household_power_consumption.txt' and produces a PNG graphic
# (line chart) of the 3 'Sub_metering_x' metrics for the days 2007-02-01 and 2007-02-02

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
vColor1 <- "black"
vColor2 <- "red"
vColor3 <- "blue"
vMain <-  ""
vXlab <- ""
vYlab <- "Energy sub metering"

# Make the plot - we turn off the axis generation and then add these manually
# so that we can specify the tick mark intervals / labels for the X axis
# Ideally we should specify the X axis labels / ticks by extracting 
# the day of the week from the Date data frame column
# So this approach gets no points in any beauty prize - but it works :)

png(file="plot3.png", width=480, height=480)
plot(1:nrow(df.data), df.data$Sub_metering_1, type = "l", col = vColor1, main = vMain, xlab = vXlab, ylab = vYlab, axes = FALSE)
lines(1:nrow(df.data), df.data$Sub_metering_2, type = "l", col = vColor2)
lines(1:nrow(df.data), df.data$Sub_metering_3, type = "l", col = vColor3)


# Place the surrounding box around the plot
box(which = "plot")

# Set the axes
axis(2)
axis(1, at = seq(from = 1, to = nrow(df.data), length.out = 3), labels = c("Thu", "Fri", "Sat"))

# Place the legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1, col = c(vColor1, vColor2, vColor3))

dev.off()
message("Plot saved as plot3.png")
