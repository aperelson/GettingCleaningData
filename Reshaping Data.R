library(reshape2)
head(mtcars)

mtcars$carname <- rownames(mtcars)

carMelt <- melt(mtcars, id=c("carname", "gear", "cyl"), measure.vars=c("mpg", "hp"))
head(carMelt,n=3)

cylData <- dcast(carMelt, cyl~variable)
cylData
cylData <- dcast(carMelt, cyl~variable, mean)
cylData

head(InsectSprays)

tapply(InsectSprays$count,InsectSprays$spray,sum)

spIns <- split(InsectSprays$count,InsectSprays$spray)
sprCount <- lapply(spIns, sum)
unlist(sprCount)

sapply(spIns, sum) # We can combine the apply-combine steps with sapply, which returns an atomic vector

#Using plyr:
ddply(InsectSprays, .(spray), summarize, sum=sum(count))

