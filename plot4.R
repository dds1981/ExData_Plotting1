# EDA Project 1 Plot 4 R Script

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

# For Plot 4
png(filename = "plot4.png")

par(mfrow=c(2,2))

# Panel 1
plot(Power$Global_active_power, xaxt="n", pch=19, cex=0.01, xlab="", ylab="Global Active Power (kilowatts)")
lines(Power$Global_active_power)
axis(1, c(1,1440,2880), c("Thursday","Friday","Saturday"))


# Panel 2
plot(Power$Voltage, xaxt="n", pch=19, cex=0.01, xlab="datetime", ylab="Voltage")
lines(Power$Voltage)
axis(1, c(1,1440,2880), c("Thursday","Friday","Saturday"))


# Panel 3
with(Power,plot(Sub_metering_1, pch=19, cex=0.01, xaxt="n", xlab="", ylab="Energy sub metering"))
with(Power, lines(Sub_metering_1))
with(Power, points(Sub_metering_2, pch=19, cex=0.01, xaxt="n", col="red"))
with(Power, lines(Sub_metering_2, col="red"))
with(Power, points(Sub_metering_3, pch=19, cex=0.01, xaxt="n", col="blue"))
with(Power, lines(Sub_metering_3, col="blue"))
axis(1, c(1,1440,2880), c("Thursday","Friday","Saturday"))
legend("topright", lwd=1, lty=1, cex=0.5, col=c("black","red","blue"),legend=c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"))


# Panel 4
plot(Power$Global_reactive_power, xaxt="n", pch=19, cex=0.01, xlab="datetime", ylab="Global Active Power (kilowatts)")
lines(Power$Global_reactive_power)
axis(1, c(1,1440,2880), c("Thursday","Friday","Saturday"))

par(mfrow=c(1,1))

dev.off()
