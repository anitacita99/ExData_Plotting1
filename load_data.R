install.packages("pacman")
# check to see if packages are installed - if not, install them
pacman::p_load(lubridate)

# download and unzip file if they don't already exist
download_data <- function() {
  if ( !file.exists("data.zip") )
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "data.zip")
  if ( !file.exists("household_power_consumption.txt") )
    unzip("data.zip")
}

create_df <- function() {
  # set formats of date and time in table
  setClass("myDate")
  setAs("character","myDate", function(from) dmy(from))
  setClass("myTime")
  setAs("character","myTime", function(from) hms(from))

  # read Feb 1st and 2nd observations
  read.table("household_power_consumption.txt", sep = ";", col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = c("?"), colClasses = c("myDate", "myTime", rep("numeric", 7) ), nrows = 2880, skip = 66637)
}