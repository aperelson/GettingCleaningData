if (!file.exists("data")) { 
    dir.create("data") 
    }

fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile="./data/cameras.csv")
cameraData <- read.table("./data/cameras.csv", sep = ",", header = TRUE)
cameraData <- read.csv("./data/cameras.csv")
head(cameraData)



fileUrl <- "http://themightyp.iapetus.feralhosting.com/MyTestData.xlsx"
download.file(fileUrl, destfile="./data/MyTestData.xlsx", mode="wb")
install.packages("xlsx")
library("xlsx")
cameraData <- read.xlsx("./data/MyTestData.xlsx", sheetIndex = 1, header = TRUE)

colIndex <- 2
rowIndex <- 2:4
cameraSubsetData <- read.xlsx("./data/MyTestData.xlsx", sheetIndex = 1, colIndex = colIndex, rowIndex = rowIndex)
cameraSubsetData