# R script to address Exploratory Data Analysis (exdata-010)assignment 1
# Reads data from 'household_power_consumption.txt' and produces a PNG graphic
# (histogram) of 'Global Active Power' metric for the days 2007-02-01 and 2007-02-02

# Check to see if the data file is present in the current directory
# If not then download the source zip file and unpack this

fileURL <- "https://d396qusza40orc.cloudfront.net/exdata/data/household_power_consumption.zip"
vDestDownloadFile <- "household_power_consumption.zip"
vDataFile <- "household_power_consumption.txt"

if(!file.exists(vDataFile))
	{
	message("Downloading data file - please wait ... ", appendLF = FALSE)
	download.file(url = fileURL, destfile = vDestDownloadFile, method = "curl", quiet = TRUE)
	message("Done", appendLF = TRUE)
	message("Unzipping data file - please wait ... ", appendLF = FALSE)
	unzip(vDestDownloadFile, overwrite = TRUE)
	message("Done", appendLF = TRUE)
	}

# Read the data, limiting ourselves to the specified dates
vRequiredDates <- c("1/2/2007", "2/2/2007")

message("Reading data to plot ...")

df.data <- subset(read.csv(vDataFile, 
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
