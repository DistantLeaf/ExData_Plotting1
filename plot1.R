plot1 <- function() {
  # This function will import the "Household Power Consumption" data and create a histogram
  # of the Global Active Power (kilowatts)
  
  # Load all data from the text file, using a static file location, but this can be changed 
  # into a variable for the plot1 function
  alldata <- read.csv("data/household_power_consumption.txt", na.strings = "?", 
                      stringsAsFactors = FALSE, sep = ";")
  
  # Selected only the data for the 1st and 2nd of February 2007
  febdata <- alldata[which(alldata$Date == "1/2/2007" | alldata$Date == "2/2/2007",),]
  
  # Create the histogram based on the sample given
  hist(febdata$Global_active_power, col = "red", main = "Global Active Power", 
       xlab = "Global Active Power (kilowatts)")
  
  # Copy the histogram from the screen device (Rstudio), and save it as a PNG file 
  # Default pixel size is set to 480 by 480
  dev.copy(png, file = "plot1.png")
  # Turn the grahic device off
  dev.off()
  
}