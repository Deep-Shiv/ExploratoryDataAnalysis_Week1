setwd("C:/Users/Coursera/c4w1/data")

# reading first line to calculate number of rows to skip and read

tmp1 <- read.table("household_power_consumption.txt", header=TRUE,col.names=c("Date", "Time", "Global_active_power","Global_reactive_power","voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),nrows=1,skip=0,sep=";")

datetime1 <- paste(as.Date(tmp1[1,1],"%d/%m/%Y"), tmp1[1,2])
datetime1<-as.POSIXct(datetime1)
datetime1

datetime2<-as.POSIXct("2007-01-31 23:59:59 PST")

r<-as.numeric(difftime(strptime(datetime1,"%Y-%m-%d %H:%M:%S"),strptime(datetime2,"%Y-%m-%d %H:%M:%S")))
r1<-round((-1)*r*24*60, digits=0)

r2<-48*60

# read table and transforming date & time

tmp2 <- read.table("household_power_consumption.txt", header=TRUE,col.names=c("Date", "Time", "Global_active_power","Global_reactive_power","voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),nrows=r2,skip=r1,sep=";")

tmp2$Date <- as.Date(tmp2$Date, format="%d/%m/%Y")

datetime <- paste(as.Date(tmp2$Date), tmp2$Time)

tmp2$Datetime <- as.POSIXct(datetime)

# Plot 2
plot(tmp2$Global_active_power~tmp2$Datetime, type="l",ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()