install.packages("ggplot2")
library(ggplot2)
## Read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

em.Baltimore<-NEI[NEI$fips=="24510",]
em.Baltimore.type<-NEI[NEI$fips=="24510",4:6]
require(data.table) 
DT <- data.table(em.Baltimore.type) 
DT<-DT[ , .(TotalEmission = sum(Emissions)), by = .(year,type)]
png(file="plot3.png", width=480, height=480)
qplot(year, TotalEmission, data=DT, color=type,geom=c("point","smooth"))
dev.off()
