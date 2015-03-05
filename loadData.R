loadData <- function () {
    # If the raw data file has not been downloaded before, no txt file in
    # current working directory, run the followning code block.
    if (!file.exists("household_power_consumption.txt")) {
        message("No data file, downloading from source ...")
        
        # Open a temporary file for zip file storage.
        temp <- tempfile()
        
        # Download the file from the URL, change from https to http
        fileURL <- "http://d396qusza40orc.cloudfront.net/exdata/data/household_power_consumption.zip"
        download.file(fileURL, temp, method = "curl")
        
        # Unzip the file and store the txt file in current WD.
        unzip(temp, "household_power_consumption.txt")
        
        # Delete the temporary file.
        unlink(temp)
    }
    # If the txt file exists in current working directory, no need to
    # download the file again.
    else message("File already exists, loading data...")
    
    # Read data from the txt file, skip the first 66637 lines and read
    # 2880 lines for the speficied date range. See below for alternative
    # approach.
    data <- read.table("household_power_consumption.txt",
                       sep = ";",
                       col.names = c("Date",
                                     "Time",
                                     "Global_active_power",
                                     "Global_reactive_power",
                                     "Voltage",
                                     "Global_intensity",
                                     "Sub_metering_1",
                                     "Sub_metering_2",
                                     "Sub_metering_3"),
                       na.strings = "?",
                       skip = 66637,
                       nrows = 2880)
    
    # Return the result.
    data

# The following code can be used to automate the process of reading data
# within the specified date range by using the SQL command. However, the
# "sqldf" package is required to use the read.csv.sql() function.

#     library("sqldf")
#     data <- read.csv.sql("household_power_consumption.txt",
#                          header = TRUE,
#                          sep    = ";",
#                          sql    ="Select * from file where Date = '1/2/2007' OR Date = '2/2/2007'"
#                          )
#     data
}