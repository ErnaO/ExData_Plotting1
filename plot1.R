## Course Project 1
## Plot 1

# Load the data
hpc <- read.table("./household_power_consumption.txt", sep=";", header=T, na.strings="?")
hpc$Date <- as.Date(hpc$Date,format="%d/%m/%Y")

# Getting the subset we need: 2007-02-01 and 2007-02-02
idx <- which(hpc$Date == as.Date("2007-02-01") | hpc$Date == as.Date("2007-02-02"))
sub_hpc <-hpc[idx,]

# Making the plot
hist(sub_hpc$Global_active_power,col="red",main="Global Active Power",
     xlab="Global Active Power (kilowatts)", ylab="Frequency")

# Writing the plot to PNG
dev.copy(png, "./plot1.png",width=480,height=480)
dev.off()

