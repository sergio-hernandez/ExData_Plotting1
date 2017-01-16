# Exploratory Data Analysis - Course project 1

## Plot 3

### Load packages

library(dplyr)
library(tidyr)
library(readr)
library(curl)
library(data.table)
library(dtplyr)
library(lubridate)
library(ggplot2)
library(lattice)
library(latticeExtra)

### Create directory for the project

myproject<-"CourseProject1"

if (file.exists(myproject)) {
      setwd(file.path(getwd(), myproject))
}else{
      dir.create(file.path(getwd(), myproject))
      setwd(file.path(getwd(), myproject))
}

### Read data

data <- read_csv2("household_power_consumption.txt")

### Make data a data table

data <- as.data.table(data)

### Turn date to Date format

data$Date <- dmy(data$Date)

### Subset rows from dates 2007-02-01 an 2007-02-02

datasubset <- filter(data, Date=="2007-02-01" | Date=="2007-02-02")

### Create a variable with date and time

datasubset$datetime <- paste0(datasubset$Date, "-00-00-00")

### Make variable a Date variable

datasubset$datetime <- ymd_hms(datasubset$datetime)

### Add seconds to the variable

datasubset$datetime <- datasubset$datetime + seconds(datasubset$Time)

### Plot 3

png(filename = "plot3.png", width = 480, height = 480)
plot(datasubset$datetime, datasubset$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(datasubset$datetime, datasubset$Sub_metering_2, col = "red")
lines(datasubset$datetime, datasubset$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1,1), col = c("black", "red", "blue"))
dev.off()
