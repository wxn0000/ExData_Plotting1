# Loading data be calling the loadData.R function.
source("loadData.R")
data <- loadData()

# Open PNG device with specified file name, dimension, unit and
# trasparent background.
png(
    "plot4.png",
    width  = 480,
    height = 480,
    units  = "px",
    bg     = "transparent"
    )

# Set multi-plot parameter. Row first.
par(mfrow = c(2,2))

# Combine the 1st and 2nd column and convert it to Date/Time class.
datetime <- strptime(paste(data[,1], data[,2]), format="%d/%m/%Y %H:%M:%S")

# 1st plot, repeat plot2.R without the main title.
plot(datetime, data$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power"
     )

# 2nd plot, with X label.
plot(datetime, data$Voltage, type = "l", ylab = "Voltage")

# 3rd plot, repeat plot3.R without the legend box border.
plot(datetime, data$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering"
)
lines(datetime, data$Sub_metering_2, col = "red")
lines(datetime, data$Sub_metering_3, col = "blue")
legend("topright",
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = c(1,1,1),
       bty = "n"
)

# 4th plot, with X label.
plot(datetime, data$Global_reactive_power, type = "l", ylab = "Global_reactive_power")

# Close PNG device and save file.
dev.off()