if(!file.exists("./data")){
    dir.create("./data")
}

fileUrl1 = "https://dl.dropboxusercontent.com/u/7710864/data/reviews-apr29.csv"
fileUrl2 = "https://dl.dropboxusercontent.com/u/7710864/data/solutions-apr29.csv"

if(!file.exists("./data/reviews.csv")) {
    download.file(fileUrl1,destfile="./data/reviews.csv")
}

if(!file.exists("./data/solutions.csv")) {
    download.file(fileUrl2,destfile="./data/solutions.csv")
}

reviews = read.csv("./data/reviews.csv")
solutions = read.csv("./data/solutions.csv")

head(reviews)
head(solutions)

names(reviews)
names(solutions)

mergedData = merge(reviews,solutions,by.x="solution_id",by.y="id",all=TRUE)
head(mergedData)

df1 = data.frame(id=sample(1:10),x=rnorm(10))
df2 = data.frame(id=sample(1:10),y=rnorm(10))

arrange(join(df1,df2),id) # merge and then sort


df1 = data.frame(id=sample(1:10),x=rnorm(10))
df2 = data.frame(id=sample(1:10),y=rnorm(10))
df3 = data.frame(id=sample(1:10),z=rnorm(10))

dfList = list(df1,df2,df3)

join_all(dfList)


