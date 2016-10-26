myapp = oauth_app(appname="twitter", 
                  key="m1qjzu2sWTRxDKE2GRKJQ", 
                  secret="uTMqU1WxSzgGWyoe4W6Ph0oSdkw3uUWuQifmPs2R0")

sig = sign_oauth1.0(app=myapp, 
                    token="43766807-qKNykCAOMxJX5RuGneZ03kJq3Y14Ugzde7EsxKwxQ",
                    token_secret="evGTssLQA3hkws2gfDeugYx3XVNjFsOPl07MDeiEaRYIG")

homeTL = GET("https://api.twitter.com/1.1/statuses/home_timeline.json", sig)

json1 = content(homeTL)

library(jsonlite)
json2 <- jsonlite::fromJSON(toJSON(json1))
