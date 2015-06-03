plot4 <- function(){
        library(sqldf)
        data <- read.csv.sql('household_power_consumption.txt', 
                             sep = ';',
                             header = TRUE,
                             sql = "select * from file where Date in 
                             ('1/2/2007', '2/2/2007')")
        data$Time <- as.POSIXct(strptime(paste(data$Date, data$Time, sep = ' '),
                                         format = '%d/%m/%Y %H:%M:%S'))
        data$Date <- as.Date(data$Time)
        
        
        #open png connection and format plot (2 by 2)
        png(filename = 'plot4.png', width = 720, height = 720)
        par(mfcol = c(2,2))
        
        #plot 1
        plot(data$Time, data$Global_active_power, 
             type = 'n',
             xlab = '', 
             ylab = 'Global Active Power')
        lines(data$Time, data$Global_active_power)
        
        #plot 2
        plot(data$Time, data$Sub_metering_1, 
             type = 'n',
             xlab = '', 
             ylab = 'Energy sub metering')
        lines(data$Time, data$Sub_metering_1)
        lines(data$Time, data$Sub_metering_2, col = 'red')
        lines(data$Time, data$Sub_metering_3, col = 'blue')
        legend('topright', pch = '__', 
               col = c('black', 'red', 'blue'), 
               legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
               bty = 'n')
       
        #plot 3
        plot(data$Time, data$Voltage,
             type = 'n',
             xlab = 'datetime',
             ylab = 'Voltage')
        lines(data$Time, data$Voltage)
        
        #plot 4
        plot(data$Time, data$Global_reactive_power,
             type= 'n',
             xlab = 'datetime',
             ylab = 'Global_reactive_power')
        lines(data$Time, data$Global_reactive_power)
        
        dev.off()
}