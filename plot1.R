setwd('C:/Users/Administrator/Desktop')
data<-read.table('household_power_consumption.txt',header=T,sep=';',
                 stringsAsFactors=F)

data$Time<-strptime(paste(data$Date,data$Time),'%d/%m/%Y %H:%M:%S')
data$Date<-as.Date(data$Date,format='%d/%m/%Y')
data<-data[data$Date %in% as.Date(c('2007-02-01','2007-02-02')),]

png('plot1.png',width=480,height=480)
with(data,hist(as.numeric(Global_active_power),
               xlab='Global Active Power (kilowatts)',
               col='red',
               main='Global Active Power'))
dev.off()
