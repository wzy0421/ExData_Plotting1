library(png)
setwd('C:/Users/Zhongyu/Documents/learning/R Proj 1/exdata-data-household_power_consumption');
data <- read.csv('household_power_consumption.txt', sep = ';');
data$Date <- as.Date(data$Date,'%d/%m/%Y')
data_to_use <- data[data$Date >= as.Date('2007-02-01') & data$Date <= as.Date('2007-02-02'),]
dims <- dim(data_to_use)
data_to_use$Global_active_power <- as.numeric(data_to_use$Global_active_power)

png('plot2.png')
plot(data_to_use$Global_active_power, type = 'l', ylab='Global Active Power(killowatt)', xaxt = "n", xlab = '')
axis(1, at=c(1,dims[1]/2,dims[1]), labels = c('Thu','Fri','Sat'))
dev.off()
