data_file=file.path("E:/Github/ExData_Plotting1/household_power_consumption.txt")
data<-read.table(data_file,sep=";",na.strings="?",header=TRUE,stringsAsFactors=FALSE)
data$DateTime<- paste(data$Date,data$Time)
data$DateTime<-as.POSIXlt(data$DateTime,format="%d/%m/%Y %H:%M:%S")
dataTU<-subset(data,DateTime>=as.POSIXlt("2007-02-01 00:00:00")&DateTime<as.POSIXlt("2007-02-03 00:00:00"))
png(file="G:/Github/R/Coursa program data/Explortary data/Project1/plot4.png",width=480,height=480,units='px')
par(mfrow=c(2,2))
plot(dataTU$DateTime,dataTU$Global_active_power,ylab='Global Active Power (kilowatts)', xlab="",type='l')
plot(dataTU$DateTime,dataTU$Voltage,ylab='Voltage', xlab="datetime",type='l')

plot(dataTU$DateTime,dataTU$Sub_metering_1,ylab='Energy sub metering',col="black", xlab="",type='l')
lines(dataTU$DateTime,dataTU$Sub_metering_2,col="red")
lines(dataTU$DateTime,dataTU$Sub_metering_3,col="blue")
legend('topright',legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c("black","red","blue"),lty='solid')

plot(dataTU$DateTime,dataTU$Global_reactive_power,ylab='Global Active Power (kilowatts)', xlab="",type='l')

dev.off()
