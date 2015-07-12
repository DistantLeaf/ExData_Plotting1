plot3 <- function() {
  # This function will import the "Household Power Consumption" data and plot the Global Active 
  # Power (kilowatts) over the period of the 1st and 2nd of February 2007
  
  # Load all data from the text file, using a static file location, but this can be changed 
  # into a variable for the plot2 function
  alldata <- read.csv("data/household_power_consumption.txt", na.strings = "?", 
                      stringsAsFactors = FALSE, sep = ";")
  
  # Selected only the data for the 1st and 2nd of February 2007
  febdata <- alldata[which(alldata$Date == "1/2/2007" | alldata$Date == "2/2/2007",),]
  
  # Create a new column call DateTime that combines the Date and Time columns into one using 
  # the POSIXct funtion. This also converts from the character format into the date/time format
  febdata$DateTime <- as.POSIXct(paste(febdata$Date, febdata$Time), format="%d/%m/%Y %H:%M:%S")
  
  # Rstudio was giving problems with the legend placement, therefore I switched to the PNG device
  # This worked well... ;) - The default is 480x480 pixels, therefore there's not need to set it.
  png(file = "plot3.png")
  
  # Create the line graph based on the sample given
  plot(febdata$DateTime, febdata$Sub_metering_1, type = "l", xlab = "", 
       ylab = "Energy sub metering")
  
  # Adding the Sub metering 2 and 3 lines to the plot
  lines(febdata$DateTime, febdata$Sub_metering_2, col = "red")
  lines(febdata$DateTime, febdata$Sub_metering_3, col = "blue")
  
  # Adding the plot to best match the example image
  legend("topright", lty=c(1,1,1), lwd=c(1,1,1), col = c("black", "red", "blue"), 
         legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), 
         x.intersp = 1, y.intersp = 1)
  
  # Turn the grahic device off
  dev.off()
  
}