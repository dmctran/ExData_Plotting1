# This function:
# - reads data file, either by downloading if a URL is not null, 
#   or from local file (dataset file downloaded and unzipped manually once)
# - subset data for the required dates
# - creates another column of data by combining date and time
# - returns the dataset ready for plotting
getData <- function(zipFileUrl = NULL, 
                    datasetFile = "household_power_consumption.txt") {
    
    colClasses = c("character", "character", 
                   "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
    
    if (is.null(zipFileUrl)) {
        # use file in current working directory
        dataset <- read.csv2(datasetFile, 
                             na.strings = "?", dec = ".", colClasses = colClasses)        
    } else {
        # download file
        temp <- tempfile()
        download.file(zipFileUrl, temp)
        dataset <- read.csv2(unz(temp, datasetFile), 
                                na.strings = "?", dec = ".", colClasses = colClasses)
        unlink(temp)
    }
    
    # get the required data for dates
    dateCondition <- ((dataset$Date == "1/2/2007") | (dataset$Date == "2/2/2007"))
    data <- subset(dataset, subset = dateCondition)
    data$datetime <- strptime(paste(data$Date, data$Time), format = "%e/%m/%Y %H:%M:%S")
    data
}