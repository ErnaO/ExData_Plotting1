## Course Project 1
## Plot 2

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
td1 <- strptime(td,format="%Y-%m-%d %H:%M:%S")

# Making the plot
plot(td1,sub_hpc$Global_active_power,type='l',
     ylab="Global Active Power (kilowatts)",xlab='')
