# Begins Plot 1

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

# Make histogram
png(filename="~/github/ExDataPlotting1/Plot1.png", width = 480, height = 480,
    units = "px")
hist(y$Global_active_power,col="red",main='Global Active Power',
     xlab='Global Active Power (kilowatts)')
dev.off()

