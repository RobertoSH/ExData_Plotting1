# Begins Plot 4

x<-read.table(file='~/household_power_consumption.txt',sep=";",header=T,
              stringsAsFactors=F)
x[,3:8]<-apply(x[,3:8],2,as.numeric)
x$Date<-as.Date(x$Date,format="%d/%m/%Y")

y<-x[x$Date>=as.Date('2007-02-01') & x$Date<=as.Date('2007-02-02'),]
rm(x)


#install.packages('plyr')
library(plyr)
y$w<-weekdays(y$Date)
Freq<-ddply(y,~w+Time,function(x) sum(x$Global_active_power))$V1
Freq1<-ddply(y,~w+Time,function(x) sum(x$Sub_metering_1))$V1
Freq2<-ddply(y,~w+Time,function(x) sum(x$Sub_metering_2))$V1
Freq3<-ddply(y,~w+Time,function(x) sum(x$Sub_metering_3))$V1
Freq4<-ddply(y,~w+Time,function(x) sum(x$Voltage))$V1
Freq5<-ddply(y,~w+Time,function(x) sum(x$Global_reactive_power))$V1

png(filename="~/github/ExDataPlotting1/Plot4.png", width = 480, height = 480,
    units = "px")
par(mfcol=c(2,2))

# 1
plot(Freq,type='l',xlab='',ylab='Global Active Power (kilowatts)',xaxt='n')
axis(1, at=c(1,length(Freq)/2+1,length(Freq)),
     labels=c('Thu','Fri','Sat'))
# 2
plot(Freq1,type='l',xlab='',ylab='Energy sub metering',xaxt='n')
axis(1, at=c(1,length(Freq)/2+1,length(Freq)),
     labels=c('Thu','Fri','Sat'))
lines(Freq2,col='red')
lines(Freq3,col='blue')
legend('topright',c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
       col=c('black','red','blue'),lty=c(1,1,1))
# 3
plot(Freq4,type='l',xlab='datetime',ylab='Voltage',xaxt='n')
axis(1, at=c(1,length(Freq4)/2+1,length(Freq4)),
     labels=c('Thu','Fri','Sat'))

# 4
plot(Freq5,type='l',xlab='datetime',ylab='Global_reactive_power',xaxt='n')
axis(1, at=c(1,length(Freq5)/2+1,length(Freq5)),
     labels=c('Thu','Fri','Sat'))


dev.off()