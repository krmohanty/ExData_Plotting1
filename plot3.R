getwd()
setwd("C:/Mystuff/datasciencecoursera/Exploratory Data Analysis")
getwd()

#read data
epc<-read.table("./data/household_power_consumption.txt",sep=";",header=T,na.strings="?",
                stringsAsFactors=F)

names(epc)

temp<-head(epc)

epc$Date<-as.Date(epc$Date,"%d/%m/%Y")

class(epc$Date)

head(epc)

epc_sub<-subset(epc, Date >= as.Date("2007-02-01") & Date <=as.Date("2007-02-02"))

epc_sub$DateTime<-paste(epc_sub$Date,epc_sub$Time)

str(epc_sub)
epc_sub$DateTime<-strptime(epc_sub$DateTime,"%Y-%m-%d %H:%M:%S")

class(epc_sub$Time)

# Plot 3 in png
plot(epc_sub$DateTime,epc_sub$Sub_metering_1
     ,type="l", 
     ylab="Energy sub metering",xlab="",main="")
lines(epc_sub$DateTime,epc_sub$Sub_metering_2,col="red")
lines(epc_sub$DateTime,epc_sub$Sub_metering_3,col="blue")
legend("topright", lty = 1, col = c("black","red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

dev.copy(png, file = "plot3.png")

dev.off()
