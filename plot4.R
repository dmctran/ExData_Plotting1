# to generate plot4, call plot4()
source("readDataset.R")

plot4 <- function(data = NULL) {
    # get data required if not passed in
    if (is.null(data)) {
        data <- getData("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip")
    }
    
    # plot
    png("plot4.png")
    par(mfcol = c(2, 2))
    with(data, {
            # top left
            plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
            
            # bottom left
            plot(datetime, Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
            points(datetime, Sub_metering_2, type = "l", col = "red")
            points(datetime, Sub_metering_3, type = "l", col = "blue")
            legend("topright", 
                   legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                   col = c("black", "red", "blue"), 
                   lty = c(1,1,1))
            
            # top right
            plot(datetime, Voltage, type = "l")
            
            # bottom right
            plot(datetime, Global_reactive_power, type = "l")
        }
    )
    dev.off()
}