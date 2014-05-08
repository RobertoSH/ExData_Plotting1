# Begins Plot 2

# Read data at home folder
x<-read.table(file='~/household_power_consumption.txt',sep=";",header=T,
              stringsAsFactors=F)
# Change strings by numeric
x[,3:8]<-apply(x[,3:8],2,as.numeric)
# Change string by date
x$Date<-as.Date(x$Date,format="%d/%m/%Y")
#Extract only required information
y<-x[x$Date>=as.Date('2007-02-01') & x$Date<=as.Date('2007-02-02'),]
#Remove original table
rm(x)

#install.packages('plyr')
library(plyr)

#Extract weekdays
y$w<-weekdays(y$Date)
#Required agregates
Freq<-ddply(y,~w+Time,function(x) sum(x$Global_active_power))$V1

#Begin png
png(filename="~/github/ExDataPlotting1/Plot2.png", width = 480, height = 480,
    units = "px")
plot(Freq,type='l',xlab='',ylab='Global Active Power (kilowatts)',xaxt='n')
axis(1, at=c(1,length(Freq)/2+1,length(Freq)),
     labels=c('Thu','Fri','Sat'))
dev.off()
