library(png)
setwd('C:/Users/Zhongyu/Documents/learning/R Proj 1/exdata-data-household_power_consumption');
data <- read.csv('household_power_consumption.txt', sep = ';');
data$Date <- as.Date(data$Date,'%d/%m/%Y')
data_to_use <- data[data$Date >= as.Date('2007-02-01') & data$Date <= as.Date('2007-02-02'),]
dims <- dim(data_to_use)
data_to_use$Global_active_power <- as.numeric(data_to_use$Global_active_power)
data_to_use$Global_reactive_power <- as.numeric(data_to_use$Global_reactive_power)
data_to_use$Sub_metering_1 <- as.numeric(data_to_use$Sub_metering_1)
data_to_use$Sub_metering_2 <- as.numeric(data_to_use$Sub_metering_2)
data_to_use$Sub_metering_3 <- as.numeric(data_to_use$Sub_metering_3)
data_to_use$Voltage <- as.numeric(data_to_use$Voltage)


png('plot4.png')
par(mfrow = c(2, 2)) 

plot(data_to_use$Global_active_power, type = 'l', ylab='Global Active Power(killowatt)', xaxt = "n", xlab = '')
axis(1, at=c(1,dims[1]/2,dims[1]), labels = c('Thu','Fri','Sat'))

plot(data_to_use$Voltage, type = 'l', ylab='Voltage', xaxt = "n", xlab = 'datetime')
axis(1, at=c(1,dims[1]/2,dims[1]), labels = c('Thu','Fri','Sat'))

plot(data_to_use$Sub_metering_1, type = 'l', xaxt = "n", xlab = '', yaxt = "n", ylab = 'Energy sub metering')
axis(1, at=c(1,dims[1]/2,dims[1]), labels = c('Thu','Fri','Sat'))
axis(2, at=c(0, 10, 20, 30))
lines(data_to_use$Sub_metering_2, col='red')
lines(data_to_use$Sub_metering_3, col='blue')
legend("topright",c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),lty=c(1,1,1),col=c('black','blue','red'),bty = "n")
plot(data_to_use$Global_reactive_power, type = 'l', ylab='Global_reactive_power', xaxt = "n", xlab = 'datetime')
axis(1, at=c(1,dims[1]/2,dims[1]), labels = c('Thu','Fri','Sat'))
dev.off()