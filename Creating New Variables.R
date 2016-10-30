if(!file.exists("./data")){
    dir.create("./data")  
}
if(!file.exists("./data/restaurants.csv")){
    fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
    download.file(fileUrl, destfile="./data/restaurants.csv")
}
restData <- read.csv("./data/restaurants.csv")

#Creating sequences
s1 <- seq(1,10,by=2)
s2 <- seq(1,10,length=3)
x <- c(1,3,8,25,100)
seq(along=x)

#Subsetting variables
restData$nearMe <- restData$neighborhood %in% c("Roland Park", "Homeland")
table(restData$nearMe)

restData$zipWrong <- ifelse(restData$zipCode < 0, TRUE, FALSE) # look for "negative" zip codes
table(restData$zipWrong, restData$zipCode < 0)

restData$zipGroups <- cut(restData$zipCode, breaks=quantile(restData$zipCode))
table(restData$zipGroups, restData$zipCode)

#Easier cutting:
install.packages("Hmisc")
library(Hmisc)

restData$zipGroups <- cut2(restData$zipCode,g=4) # "bin" zipCode into four groups
table(restData$zipGroups)

# Creating factor variables:
restData$zcf <- factor(restData$zipCode)
restData$zcf[1:10]
class(restData$zcf)

yesno <- sample(c("yes", "no"), size=10, replace=TRUE)
yesnofac <- factor(yesno, levels=c("yes","no"))
yesnofac # levels default to alphabetical order
relevel(yesnofac, ref="yes")
as.numeric(yesnofac)

#Using the mutate function
library(Hmisc); library(plyr)
restData2 <- mutate(restData, zipGroups=cut2(zipCode, g=4))
table(restData2$zipGroups)
                                                                                                                                                             