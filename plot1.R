plot1 <- function(){
        library(sqldf)
        data <- read.csv.sql('household_power_consumption.txt', 
                             sep = ';',
                             header = TRUE,
                             sql = "select * from file where Date in 
                             ('1/2/2007', '2/2/2007')")
        data$Time <- as.POSIXct(strptime(paste(data$Date, data$Time, sep = ' '),
                              format = '%d/%m/%Y %H:%M:%S'))
        data$Date <- data$Date <- as.Date(data$Time)
        
        png(filename = 'plot1.png')
        hist(data$Global_active_power, 
             main= 'Global Active Power',
             xlab= 'Global Active Power (kilowatts)', 
             col = 'red')
        dev.off()
}