chicago <- readRDS("data\chicago.rds")

head(select(chicago, city:dptp))

chi.f <- filter(chicago, pm25tmean2 > 30)
chi.f <- filter(chicago, pm25tmean2 > 30 & tmpd > 80)

chicago <- arrange(chicago, date)
chicago <- arrange(chicago, desc(date))

chicago <- rename(chicago, pm25 = pm25tmean2, dewpoint = dptp)

chicago <- mutate(chicago, pm25detrend = pm25 - mean(pm25, na.rm = TRUE))

chicago <- mutate(chicago, tempcat = factor(1*(tmpd>80),labels = c("cold","hot")))

hotcold <- group_by(chicago, tempcat)
summarise(hotcold, pm25=mean(pm25), o3 = max(o3tmean2), no2=median(no2tmean2))
summarise(hotcold, pm25=mean(pm25, na.rm=TRUE), o3 = max(o3tmean2), no2=median(no2tmean2))

chicago <- mutate(chicago, year= as.POSIXlt(date)$year + 1900)
years <- group_by(chicago, year)
summarise(years, pm25=mean(pm25, na.rm=TRUE), o3 = max(o3tmean2), no2=median(no2tmean2))

chicago %>%
    mutate(month = as.POSIXlt(date)$mon+1) %>%
    group_by(month) %>%
    summarize(pm25=mean(pm25, na.rm=TRUE), o3 = max(o3tmean2), no2=median(no2tmean2))