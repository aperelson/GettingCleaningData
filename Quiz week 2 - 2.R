if (!file.exists("data")) { dir.create("data") }

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileUrl, destfile="./data/acs.csv")
acs <- read.csv("./data/acs.csv")
head(acs)

install.packages("sqldf")
library(sqldf)

sqldf::read.csv.sql("./data/acs.csv", sql="select distinct AGEP from acs", header = TRUE)