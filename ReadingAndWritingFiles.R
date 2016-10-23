##CSV
if (!file.exists("data")) { 
    dir.create("data") 
    }

fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile="./data/cameras.csv")
cameraData <- read.table("./data/cameras.csv", sep = ",", header = TRUE)
cameraData <- read.csv("./data/cameras.csv")
head(cameraData)


##XLSX
install.packages("xlsx")
library("xlsx") #Might need to install Java as well

fileUrl <- "http://themightyp.iapetus.feralhosting.com/MyTestData.xlsx"
download.file(fileUrl, destfile="./data/MyTestData.xlsx", mode="wb")
install.packages("xlsx")
library("xlsx")
cameraData <- read.xlsx("./data/MyTestData.xlsx", sheetIndex = 1, header = TRUE)

colIndex <- 2
rowIndex <- 2:4
cameraSubsetData <- read.xlsx("./data/MyTestData.xlsx", sheetIndex = 1, colIndex = colIndex, rowIndex = rowIndex)
cameraSubsetData


##XML
install.packages("XML")
library(XML)

fileUrl <- "http://www.w3schools.com/xml/simple.xml"
doc <- xmlTreeParse(fileUrl, useInternalNodes = TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)
names(rootNode)

rootNode[[1]]
rootNode[[1]][[1]]

xpathSApply(rootNode, "//name", xmlValue)
xpathSApply(rootNode, "//price", xmlValue)

fileUrl <- "http://www.espn.com/nfl/team/_/name/bal/baltimore-ravens"
doc <- htmlTreeParse(fileUrl, useInternalNodes = TRUE)
scores <- xpathSApply(doc, "//li[@class='score']",xmlValue)
teams <- xpathSApply(doc,"//li[@class='team-name']",xmlValue)

##JSON
install.packages("jsonlite")
library(jsonlite)
jsonData <- fromJSON("https://api.github.com/users/aperelson/repos")
names(jsonData)
jsonData$owner$login

myjson <- toJSON(iris, pretty = TRUE)
cat(myjson)

##data.table
install.packages("data.table")
library(data.table)

DF = data.frame(x=rnorm(9),y=rep(c("a","b","c"),each=3), z=rnorm(9))
head(DF,3)

DT = data.table(x=rnorm(9),y=rep(c("a","b","c"),each=3), z=rnorm(9))
head(DT,3)

DT[DT$y=="a",]

DT[2,]
DT[,table(y)]
DT[,list(mean(x),sum(z))]

DT[,w:=z^2]

DT2 <- DT
DT[,y:=2]
head(DT2,3)

DT[,m:={tmp <- (x+z); log2(tmp+5)}]
DT[,a:=x>0]
DT[,b:=mean(x+w), by=a]

set.seed(123)
DT <- data.table(x=sample(letters[1:3],1E5,TRUE))
DT[,.N,by=x]

DT <- data.table(x=rep(c("a","b","c"),each=100),y=rnorm(300))
setkey(DT,x)
DT['a']

DT1 <- data.table(x=c('a','a','b','dt1'), y=1:4)
DT2 <- data.table(x=c('a','b','dt2'), z=5:7)
setkey(DT1,x)
setkey(DT2,x)
merge(DT1,DT2)


big_df <- data.frame(x=rnorm(1E6), y=rnorm(1E6))
file <- tempfile()
write.table(big_df, file=file, row.names = FALSE, col.names = TRUE, sep="\t", quote = FALSE)

temp1 <- fread(file) ## creates data.table - fast
temp2 <- read.table(file, header = TRUE, sep="\t") ## creates data.frame - slow
