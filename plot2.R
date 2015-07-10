plot2 <- function() {
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
  
  # Create the line graph based on the sample given
  plot(febdata$DateTime, febdata$Global_active_power, type = "l", 
       xlab = "", ylab = "Global Active Power (kilowatts)")
  
  # Copy the line plot from the screen device (Rstudio), and save it as a PNG file 
  # Default pixel size is set to 480 by 480
  dev.copy(png, file = "plot2.png")
  # Turn the grahic device off
  dev.off()
  
}