if(!file.exists("./data")){
    dir.create("./data")  
}
if(!file.exists("./data/restaurants.csv")){
    fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
    download.file(fileUrl, destfile="./data/restaurants.csv")
}
restData <- read.csv("./data/restaurants.csv")

summary(restData)

str(restData)

quantile(restData$councilDistrict, na.rm = TRUE)

quantile(restData$councilDistrict, probs = c(0.5,0.75,0.9))

table(restData$zipCode,useNA = "ifany")

#2 dimensional table:
table(restData$councilDistrict,restData$zipCode)

#check for missing values:
sum(is.na(restData$councilDistrict))
any(is.na(restData$councilDistrict))

all(restData$zipCode > 0)

colSums(is.na(restData))

all(colSums(is.na(restData)) == 0)

table(restData$zipCode %in% c("21212")) # determine number of restaurants in 21212
table(restData$zipCode %in% c("21212","21213"))

#subset the data frame:
restData[restData$zipCode %in% c("21212","21213"),]

#cross tabs:
data(UCBAdmissions)
DF = as.data.frame(UCBAdmissions)
summary(DF)

xt <- xtabs(Freq ~ Gender + Admit, data=DF)
xt


#Flat tables
warpbreaks$replicate <- rep(1:9, len=54)
xt <- xtabs(breaks ~ ., data=warpbreaks)
xt
ftable(xt)


#Size of data set:
fakeData <- rnorm(1e5)
object.size(fakeData)
print(object.size(fakeData), units="Mb")

