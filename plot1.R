library(png)
setwd('C:/Users/Zhongyu/Documents/learning/R Proj 1/exdata-data-household_power_consumption');
data <- read.csv('household_power_consumption.txt', sep = ';');
data$Date <- as.Date(data$Date,'%d/%m/%Y')
data_to_use <- data[data$Date >= as.Date('2007-02-01') & data$Date <= as.Date('2007-02-02'),]
data_to_use$Global_active_power <- as.numeric(data_to_use$Global_active_power)

png(file = 'plot1.png')
hist(data_to_use$Global_active_power,main = 'Global Active Power', xlab = 'Global Active Power(killowatt)', col='red')
dev.off()



