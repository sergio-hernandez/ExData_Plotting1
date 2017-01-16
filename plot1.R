# Exploratory Data Analysis - Course project 1

## Plot 1

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

### Set global active power as numeric

datasubset$Global_active_power <- as.numeric(datasubset$Global_active_power)

### Global Active Power histogram

png(filename = "plot1.png", width = 480, height = 480)
hist(datasubset$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
dev.off()
