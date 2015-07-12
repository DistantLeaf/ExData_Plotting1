plot4 <- function() {
  # This function will import the "Household Power Consumption" data and plot four different 
  # graphs showing data from the 1st and 2nd of February 2007. 
  
  # Load all data from the text file, using a static file location, but this can be changed 
  # into a variable for the plot2 function
  alldata <- read.csv("data/household_power_consumption.txt", na.strings = "?", 
                      stringsAsFactors = FALSE, sep = ";")
  
  # Selected only the data for the 1st and 2nd of February 2007
  febdata <- alldata[which(alldata$Date == "1/2/2007" | alldata$Date == "2/2/2007",),]
  
  # Create a new column call DateTime that combines the Date and Time columns into one using 
  # the POSIXct funtion. This also converts from the character format into the date/time format
  febdata$DateTime <- as.POSIXct(paste(febdata$Date, febdata$Time), format="%d/%m/%Y %H:%M:%S")
  
  # Activate the PNG graphics device and set storage name and location
  png(file = "plot4.png")
  
  # Create frame for the four plots, 2 rows and 2 columns
  par(mfrow=c(2,2))
  
  # Create the line graph for Global Active Power
  plot(febdata$DateTime, febdata$Global_active_power, type = "l", 
       xlab = "", ylab = "Global Active Power")
  
  # Create the line graph for Voltage
  plot(febdata$DateTime, febdata$Voltage , type = "l", 
       xlab = "datetime", ylab = "Voltage")
  
  # Create the line graphs for the sub metering
  plot(febdata$DateTime, febdata$Sub_metering_1, type = "l", xlab = "", 
       ylab = "Energy sub metering")
  # Adding the Sub metering 2 and 3 lines to the plot
  lines(febdata$DateTime, febdata$Sub_metering_2, col = "red")
  lines(febdata$DateTime, febdata$Sub_metering_3, col = "blue")
  # Adding the lengend to best match the example image (without border)
  legend("topright", lty=c(1,1,1), lwd=c(1,1.1), col = c("black", "red", "blue"), 
         legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), bty = "n")
  
  # Create the line graph for Global Reactive Power
  plot(febdata$DateTime, febdata$Global_reactive_power , type = "l", 
       xlab = "datetime", ylab = "Global_reactive_power", yaxt="n")
  # Set the Y-axis to display all the values on each tick
  axis(2,cex.axis= 0.8, tick = TRUE) 
  
  # Turn the grahic device off
  dev.off()
  
}