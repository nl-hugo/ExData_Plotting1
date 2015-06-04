#
# Coursera | Exploratory Data Analysis
# Project 1
# plot2.R
#

# Check if data directory exists, create one if needed
if (!file.exists("data")) {
  dir.create("data")
}

# Download the dataset and unzip the files
if (!file.exists("./data/household_power_consumption.txt")) {
  fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileURL, destfile="./data/dataset.zip")
  unzip("./data/household_power_consumption.txt", exdir="./data")
}

# Read the data
d <- read.table(file="./data/household_power_consumption.txt", header=TRUE, sep=";", nrows=69516, na.strings="?", stringsAsFactors=FALSE)

# Convert to Date and Time
d$Date <- as.Date(d$Date, "%d/%m/%Y")
d$DateTime <- as.POSIXct(paste(d$Date, d$Time))

# Select data for 2007-02-01 and 2007-02-02 only
d <- subset(d, Date >= "2007-02-01" & Date <= "2007-02-02")

# Plot the line chart
plot(d$Global_active_power~d$DateTime, type="l",
     ylab="Global Active Power (kilowatts)", 
     xlab="")

# Save plot to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
