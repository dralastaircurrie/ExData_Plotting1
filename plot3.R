library(dplyr)
#Load the data, parse dates and times, and select the relevant days

minDay=as.Date("2007-02-01")
maxDay=as.Date("2007-02-02")

df <- read.table('household_power_consumption.txt',T,";",stringsAsFactors = F,na.strings="?")
df <- df %>% mutate(Datetime = parse_date_time(paste(Date,Time),"dmyHMS"))

df<-df %>% filter(between(date(Datetime),minDay,maxDay))

#When I say png, you say plot...

png(filename = 'plot3.png', height = 480, width = 480)

plot(df$Datetime,df$Sub_metering_1,'l',col='black',xlab = '',ylab = 'Energy sub metering')
lines(df$Datetime,df$Sub_metering_2,col='red')
lines(df$Datetime,df$Sub_metering_3,col='blue')
legend("topright",lty=c(1,1,1),col=c('black','red','blue'),
       legend=c('Sum_metering_1','Sum_metering_2','Sum_metering_3'))

dev.off()