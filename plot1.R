# Begins Plot 1

x<-read.table(file='~/household_power_consumption.txt',sep=";",header=T,
              stringsAsFactors=F)
x[,3:8]<-apply(x[,3:8],2,as.numeric)
x$Date<-as.Date(x$Date,format="%d/%m/%Y")

y<-x[x$Date>=as.Date('2007-02-01') & x$Date<=as.Date('2007-02-02'),]
rm(x)

png(filename="~/github/ExDataPlotting1/Plot1.png", width = 480, height = 480,
    units = "px")
hist(y$Global_active_power,col="red",main='Global Active Power',
     xlab='Global Active Power (kilowatts)')
dev.off()

