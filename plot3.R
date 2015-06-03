plot3 <- function(){
        library(sqldf)
        data <- read.csv.sql('household_power_consumption.txt', 
                             sep = ';',
                             header = TRUE,
                             sql = "select * from file where Date in 
                             ('1/2/2007', '2/2/2007')")
        data$Time <- as.POSIXct(strptime(paste(data$Date, data$Time, sep = ' '),
                                         format = '%d/%m/%Y %H:%M:%S'))
        data$Date <- data$Date <- as.Date(data$Time)
        
        png(filename = 'plot3.png')
        plot(data$Time, data$Sub_metering_1, 
             type = 'n',
             xlab = '', 
             ylab = 'Energy sub metering')
        lines(data$Time, data$Sub_metering_1)
        lines(data$Time, data$Sub_metering_2, col = 'red')
        lines(data$Time, data$Sub_metering_3, col = 'blue')
        legend('topright', pch = '___', 
               col = c('black', 'red', 'blue'), 
               legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
               
        dev.off()
}