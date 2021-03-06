setwd('C:/Users/Administrator/Desktop')
data<-read.table('household_power_consumption.txt',header=T,sep=';',
                 stringsAsFactors=F)

data$Time<-strptime(paste(data$Date,data$Time),'%d/%m/%Y %H:%M:%S')
data$Date<-as.Date(data$Date,format='%d/%m/%Y')
data<-data[data$Date %in% as.Date(c('2007-02-01','2007-02-02')),]

png('plot3.png',width=480,height=480)
with(data,plot(Time,Sub_metering_1,type='l',
               ylab='Energy sub metering',
               xlab=''))
with(data,lines(Time,Sub_metering_2,type='l',col='red'))
with(data,lines(Time,Sub_metering_3,type='l',col='blue'))
legend('topright',col=c('black','red','blue'),lty=1,
      legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
dev.off()
