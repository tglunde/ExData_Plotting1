plot3 <- function() {
  if(file.exists("power.zip")==FALSE) {
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",mode="wb",destfile="power.zip")
  } else {
    message("re-using previously loaded file power.zip")
  }  
  if(file.exists("household_power_consumption.txt")==FALSE) {
    unzip("power.zip")
  }
  if(is.null(df)) {
    df <- read.table("household_power_consumption.txt",na.string="?", sep=";", header=TRUE, dec=".")    
  }
  if(is.null(df2)) {
    df2 <- df[with(df, Date=="1/2/2007"|Date=="2/2/2007"),]    
  }
  if(is.null(dateTime)) {
    dateTime <- strptime(paste(df2$Date,df$Time), format="%d/%m/%Y %H:%M:%S")
  }
  png(filename="figure/plot3.png", width=480,height=490)
  
  plot(dateTime,df2$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(dateTime,df2$Sub_metering_2, type="l", col="red")
  lines(dateTime,df2$Sub_metering_3, type="l", col="blue")
  legend("topright", lty=c(1,1), col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

  dev.off()
}