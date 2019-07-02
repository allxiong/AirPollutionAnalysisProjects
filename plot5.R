#How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

em.Baltimore.vehicle<-NEI[NEI$fips=="24510"& (NEI$type=="ON-ROAD"),]
em.Baltimore.vehicle<-with(em.Baltimore.vehicle, tapply(Emissions, year, sum, na.rm=T))
years<-names(em.Baltimore.vehicle)
d<-data.frame(years, em.Baltimore.vehicle)
png(file="plot5.png", width=480, height=480)
barplot(names.arg=d$years, height=d$em, xlab="Year", ylab="Emissions (tons)", main="Emission from motor vehicle sources of Baltimore")
dev.off()
