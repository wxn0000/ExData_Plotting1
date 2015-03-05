# Loading data be calling the loadData.R function.
source("loadData.R")
data <- loadData()

# Open PNG device with specified file name, dimension, unit and
# trasparent background.
png(
    "plot3.png",
    width  = 480,
    height = 480,
    units  = "px",
    bg     = "transparent"
    )

# Combine the 1st and 2nd column and convert it to Date/Time class.
datetime <- strptime(paste(data[,1], data[,2]), format="%d/%m/%Y %H:%M:%S")

# Plot the first line in black (default), and XY label.
plot(datetime, data$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering"
     )

# Add the 2nd and 3rd lines in red and blue.
lines(datetime, data$Sub_metering_2, col = "red")
lines(datetime, data$Sub_metering_3, col = "blue")

# Add legend in the top right corner.
legend("topright",
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = c(1,1,1)
       )

# Close PNG device and save file.
dev.off()