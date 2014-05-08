# Begins Plot 3

x<-read.table(file='~/household_power_consumption.txt',sep=";",header=T,
              stringsAsFactors=F)
x[,3:8]<-apply(x[,3:8],2,as.numeric)
x$Date<-as.Date(x$Date,format="%d/%m/%Y")

y<-x[x$Date>=as.Date('2007-02-01') & x$Date<=as.Date('2007-02-02'),]
rm(x)

#install.packages('plyr')
library(plyr)
y$w<-weekdays(y$Date)
Freq1<-ddply(y,~w+Time,function(x) sum(x$Sub_metering_1))$V1
Freq2<-ddply(y,~w+Time,function(x) sum(x$Sub_metering_2))$V1
Freq3<-ddply(y,~w+Time,function(x) sum(x$Sub_metering_3))$V1

png(filename="~/github/ExDataPlotting1/Plot3.png", width = 480, height = 480,
    units = "px")
plot(Freq1,type='l',xlab='',ylab='Energy sub metering',xaxt='n')
axis(1, at=c(1,length(Freq)/2+1,length(Freq)),
     labels=c('Thu','Fri','Sat'))
lines(Freq2,col='red')
lines(Freq3,col='blue')
legend('topright',c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
       col=c('black','red','blue'),lty=c(1,1,1))
dev.off()
