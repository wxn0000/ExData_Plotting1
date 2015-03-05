# Loading data be calling the loadData.R function.
source("loadData.R")
data <- loadData()

# Open PNG device with specified file name, dimension, unit and
# trasparent background.
png(
    "plot1.png",
    width  = 480,
    height = 480,
    units  = "px",
    bg     = "transparent"
    )

# Plot the histogram with specified Title, color, and X-axis label
hist(data[,3],
     main = "Global Active Power",
     col  = "red",
     xlab = "Global Active Power (kilowatts)"
     )

# Close PNG device and save file.
dev.off()