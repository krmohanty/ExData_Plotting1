getwd()
setwd("C:/Mystuff/datasciencecoursera/Exploratory Data Analysis")
getwd()

#read data
epc<-read.table("./data/household_power_consumption.txt",sep=";",header=T,na.strings="?",
                stringsAsFactors=F)

names(epc)

epc$Date<-as.Date(epc$Date,"%d/%m/%Y")

class(epc$Date)

head(epc)

epc_sub<-subset(epc, Date >= as.Date("2007-02-01") & Date <=as.Date("2007-02-02"))

epc_sub$DateTime<-paste(epc_sub$Date,epc_sub$Time)

str(epc_sub)
epc_sub$DateTime<-strptime(epc_sub$DateTime,"%Y-%m-%d %H:%M:%S")

class(epc_sub$Time)

hist(epc_sub$Global_active_power, 
     xlab="Global Active Power (kilowatts)",
     col="Red",
     main="Global Active Power")

## plot 1 in png
dev.copy(png, file = "plot1.png")

dev.off()
