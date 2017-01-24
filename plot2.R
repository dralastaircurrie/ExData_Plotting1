library(dplyr)
#Load the data, parse dates and times, and select the relevant days

minDay=as.Date("2007-02-01")
maxDay=as.Date("2007-02-02")

df <- read.table('household_power_consumption.txt',T,";",stringsAsFactors = F,na.strings="?")
df <- df %>% mutate(Datetime = parse_date_time(paste(Date,Time),"dmyHMS"))

df<-df %>% filter(between(date(Datetime),minDay,maxDay))

#When I say png, you say plot...

png(filename = 'plot2.png', height = 480, width = 480)
plot(df$Datetime,df$Global_active_power,'l',xlab = '',ylab = "Global Active Power (kilowatts)")

dev.off()