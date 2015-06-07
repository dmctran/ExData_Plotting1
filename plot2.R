# to generate plot2, call plot2()
source("readDataset.R")

plot2 <- function(data = NULL) {
    # get data required if not passed in
    if (is.null(data)) {
        data <- getData("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip")
    }
    
    # plot
    png("plot2.png")
    with(data, plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
    dev.off()
}