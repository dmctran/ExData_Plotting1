# to generate plot1, call plot1()
source("readDataset.R")

plot1 <- function(data = NULL) {
    # get data required if not passed in
    if (is.null(data)) {
        data <- getData("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip")
    }
    
    # plot
    png("plot1.png")
    hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
    dev.off()
}