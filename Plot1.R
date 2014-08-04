# 
# Plot1.R 
#
# EDA Course Project 1 
# Doug McCaleb
#
# Data comes from https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption
#

# Set the working directory

setwd("c:/Workspace")

# Get the libraries

library(data.table)

# Download, unzip, and table-ize the data

zipurl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(zipurl,destfile="household_power_consumption.zip")

unzip("household_power_consumption.zip") # this will extract the entire folder

data <- read.table("household_power_consumption.txt", 
                   sep = ";", 
                   header = TRUE, 
                   stringsAsFactors = FALSE,
                   na.strings = "?")

# Convert the date format and subset by date to select data for 2007-02-01 - 2007-02-02 inclusive

data$Date <- as.Date(data$Date, "%d/%m/%Y")

selectedData <- subset(data, ((data$Date >= "2007-02-01") & (data$Date <= "2007-02-02")), na.rm = TRUE)

# Quality Check of selectedData
# 
# > str(selectedData)
# 'data.frame':        2880 obs. of  9 variables:
#         $ Date                 : Date, format: "2007-02-01" "2007-02-01" "2007-02-01" "2007-02-01" ...
# $ Time                 : chr  "00:00:00" "00:01:00" "00:02:00" "00:03:00" ...
# $ Global_active_power  : num  0.326 0.326 0.324 0.324 0.322 0.32 0.32 0.32 0.32 0.236 ...
# $ Global_reactive_power: num  0.128 0.13 0.132 0.134 0.13 0.126 0.126 0.126 0.128 0 ...
# $ Voltage              : num  243 243 244 244 243 ...
# $ Global_intensity     : num  1.4 1.4 1.4 1.4 1.4 1.4 1.4 1.4 1.4 1 ...
# $ Sub_metering_1       : num  0 0 0 0 0 0 0 0 0 0 ...
# $ Sub_metering_2       : num  0 0 0 0 0 0 0 0 0 0 ...
# $ Sub_metering_3       : num  0 0 0 0 0 0 0 0 0 0 ...
# 
# > nrow(selectedData)
# [1] 2880
# 
# > ncol(selectedData)
# [1] 9
# 
# > min(selectedData$Date)
# [1] "2007-02-01"
# 
# > max(selectedData$Date)
# [1] "2007-02-02"

png("Plot1.png",bg="white")

hist(selectedData$Global_active_power,
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)")

dev.off()

