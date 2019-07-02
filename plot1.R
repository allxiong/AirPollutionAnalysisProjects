## Read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#compare total emission of 1999 and 2008
em<-with(NEI, tapply(Emissions, year, sum, na.rm=T))
years<-names(em)
d<-data.frame(years, em)
png(file="plot1.png", width=480, height=480)
barplot(names.arg=d$years, height=d$em/1000, xlab="Year", ylab="Emissions (kilotons)", main="Total PM2.5 emission by year")
dev.off()
