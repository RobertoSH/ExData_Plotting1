# Begins Plot 2

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

png(filename="~/github/ExDataPlotting1/Plot2.png", width = 480, height = 480,
    units = "px")
plot(Freq,type='l',xlab='',ylab='Global Active Power (kilowatts)',xaxt='n')
axis(1, at=c(1,length(Freq)/2+1,length(Freq)),
     labels=c('Thu','Fri','Sat'))
dev.off()
