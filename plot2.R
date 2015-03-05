# Loading data be calling the loadData.R function.
source("loadData.R")
data <- loadData()

# Open PNG device with specified file name, dimension, unit and
# trasparent background.
png(
    "plot2.png",
    width  = 480,
    height = 480,
    units  = "px",
    bg     = "transparent"
    )

# Combine the 1st and 2nd column and convert it to Date/Time class.
datetime <- strptime(paste(data[,1], data[,2]), format="%d/%m/%Y %H:%M:%S")

# Line plot with no X-axis label, and specified Y-axis label.
plot(datetime, data$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)"
     )

# Close PNG device and save file.
dev.off()