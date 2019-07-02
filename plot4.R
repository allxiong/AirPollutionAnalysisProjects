#Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#which SCC code contains coal combustion
coal.related<-grepl("coal", SCC$Short.Name, ignore.case=TRUE)
scc.coal<-SCC[coal.related,]

#merge data
mrg<-merge(NEI, scc.coal, by="SCC")

em<-with(mrg, tapply(Emissions, year, sum, na.rm=T))
years<-names(em)
d<-data.frame(years, em)
par(mfrow=c(1,1))
png(file="plot4.png", width=480, height=480)
barplot(height=d$em/1000, names.arg=d$years, xlab="Year", ylab="Emissions (kilotons", main="Emission from coal related sources 1999-2008")
dev.off()