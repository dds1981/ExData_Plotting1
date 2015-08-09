# EDA Project 1 Plot 2 R Script

# Download the File
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, "C:/Users/Doug/Documents/Online Courses/Data Science Specialization JHU/Exploratory Data Analysis 2014-07/exdata-data-household_power_consumption.zip")
unzip("exdata-data-household_power_consumption.zip")


# Read the entire data set into memory
housePower<-read.table("household_power_consumption.txt", 
                       header=TRUE, 
                       sep=";", 
                       na.strings="?", 
                       colClasses=c("character","character","numeric",
                                    "numeric","numeric","numeric","numeric",
                                    "numeric","numeric"), 
                       stringsAsFactors=FALSE)


# Create a Combined Date/Time Column in housePower datatable 
housePower$DateTime<-strptime(paste(housePower$Date, housePower$Time, sep=""), 
                                format="%d/%m/%Y %H:%M:%S")

# Subset the data by the desired date range (02/01/2007-02/02/2007)
Power<-subset(housePower,housePower$Date=="1/2/2007" | housePower$Date=="2/2/2007")

# For Plot 2
png(filename = "plot2.png")
plot(Power$Global_active_power, xaxt="n", pch=19, cex=0.01, xlab="", ylab="Global Active Power (kilowatts)")
lines(Power$Global_active_power)
axis(1, c(1,1440,2880), c("Thursday","Friday","Saturday"))
dev.off()


