
## Read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#compare total emission of 1999 and 2008
em.Baltimore<-NEI[NEI$fips=="24510",]
em.Baltimore<-with(em.Baltimore, tapply(Emissions, year, sum, na.rm=T))
years<-names(em.Baltimore)
d<-data.frame(years, em.Baltimore)
png(file="plot2.png", width=480, height=480)
barplot(names.arg=d$years, height=d$em, xlab="Year", ylab="Emissions", main="Total PM2.5 emission of Baltimore by year")
dev.off()


