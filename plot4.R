## Course Project 1
## Plot 4

# Showing the weekdays in English, otherwise it will be in Dutch...
Sys.setlocale("LC_TIME", "English")

# Load the data
hpc <- read.table("./household_power_consumption.txt", sep=";", header=T, na.strings="?")
hpc$Date <- as.Date(hpc$Date,format="%d/%m/%Y")

# Getting the subset we need: 2007-02-01 and 2007-02-02
idx <- which(hpc$Date == as.Date("2007-02-01") | hpc$Date == as.Date("2007-02-02"))
sub_hpc <-hpc[idx,]

# Combine date and time
td <- paste(sub_hpc$Date,sub_hpc$Time)
sub_hpc$DateTime <- strptime(td,format="%Y-%m-%d %H:%M:%S")

png("./plot4.png",width=480,height=480, units="px")

# Making 4 plots
par(mfcol=c(2,2))

# Upperleft plot
plot(sub_hpc$DateTime,sub_hpc$Global_active_power,type='l',
     ylab="Global Active Power (kilowatts)",xlab='')

# Lowerleft plot
with(sub_hpc, {
    plot(DateTime, Sub_metering_1, type='l',ylab="Energy sub metering",xlab='',bg=NULL)
    lines(DateTime, Sub_metering_2,col="red")
    lines(DateTime, Sub_metering_3, col="blue")
    legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),
           lty=c(1,1,1),bty="n",cex=0.9)
})

# Upperright plot
with(sub_hpc, {
    plot(DateTime,Voltage,type='l',ylab="Voltage")
})

# Lowerright plot
with(sub_hpc, {
    plot(DateTime,Global_reactive_power,type='l',ylab="Global_reactive_power")
})

dev.off()
