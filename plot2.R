##set working directory
setwd("C:\\Users\\Jinal\\Downloads\\exdata_data_household_power_consumption")

##read the whole household_power_consmption.txt into memory
dataset<- read.table("household_power_consumption.txt",sep=";",na.strings="?",header=TRUE,stringsAsFactors=FALSE)

##subset based on the dates 01FEB2007 and 02FEB2007
forplots<-dataset[dataset$Date =='1/2/2007'|dataset$Date =='2/2/2007',]

##remove dataset dataframe
rm(dataset)

##put date and time into vectors
date<-forplots[,1]
time<-forplots[,2]

##paste date and time and reinterpret in datetime format
datetime<-strptime(paste(date,time,sep=" "),"%d/%m/%Y %H:%M:%S")

## make new dataframe with forplots + datetime vector
newplots<-cbind(forplots,datetime)

## remove forplots dataframe
rm(forplots)

#plot 2
png(file="plot2.png",width=480,height=480)
with(newplots,plot(datetime,Global_active_power,type="l",
                   ylab="Global Active Power (kilowatts)",
                   xlab=" "))
dev.off()