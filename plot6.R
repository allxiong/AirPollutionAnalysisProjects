install.packages("ggplot2")
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

em.Baltimore.vehicle<-NEI[NEI$fips=="24510"& (NEI$type=="ON-ROAD"),]
em.Baltimore.vehicle<-with(em.Baltimore.vehicle, tapply(Emissions, year, sum, na.rm=T))
years<-names(em.Baltimore.vehicle)
d1<-data.frame(years, em.Baltimore.vehicle)
names(d1)<-c("Year", "Emissions")
d1$City<-"Baltimore"

em.LA.vehicle<-NEI[NEI$fips=="06037"& (NEI$type=="ON-ROAD"),]
em.LA.vehicle<-with(em.LA.vehicle, tapply(Emissions, year, sum, na.rm=T))
years<-names(em.LA.vehicle)
d2<-data.frame(years, em.LA.vehicle)
names(d2)<-c("Year", "Emissions")
d2$City<-"LA"
DT<-rbind(d1,d2)

png(file="plot6.png", width=480, height=480)
g<-ggplot(DT, aes(x=factor(Year), y=Emissions, fill=City))
g<-g+geom_bar(stat="identity")
g<-g+facet_grid(.~City)
g<-g+labs(x="Year", y="Emissions (tons)", title="Total Emission from motor vehicle sources")
print(g)
dev.off()
