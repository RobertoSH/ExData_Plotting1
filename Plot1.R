#Comienza Plot 1

x<-read.table(file='~/household_power_consumption.txt',sep=";",header=T)
x$Date<-as.Date(x$Date)
