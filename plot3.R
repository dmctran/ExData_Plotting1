# to generate plot3, call plot3()
source("readDataset.R")

plot3 <- function(data = NULL) {
    # get data required if not passed in
    if (is.null(data)) {
        data <- getData("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip")
    }
    
    # plot
    png("plot3.png")
    with(data, plot(datetime, Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering"))
    with(data, points(datetime, Sub_metering_2, type = "l", col = "red"))
    with(data, points(datetime, Sub_metering_3, type = "l", col = "blue"))
    legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
           col = c("black", "red", "blue"), 
           lty = c(1,1,1))
    dev.off()
}