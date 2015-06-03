plot2 <- function(){
        library(sqldf)
        data <- read.csv.sql('household_power_consumption.txt', 
                             sep = ';',
                             header = TRUE,
                             sql = "select * from file where Date in 
                             ('1/2/2007', '2/2/2007')")
        data$Time <- as.POSIXct(strptime(paste(data$Date, data$Time, sep = ' '),
                                         format = '%d/%m/%Y %H:%M:%S'))
        data$Date <- data$Date <- as.Date(data$Time)

        png(filename = 'plot2.png')
        plot(data$Time, data$Global_active_power, 
             type = 'n',
             xlab = '', 
             ylab = 'Global Active Power (kilowatts)')
        lines(data$Time, data$Global_active_power)
        dev.off() 
}