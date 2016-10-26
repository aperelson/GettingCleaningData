

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. To make your own application, register at at
#    https://github.com/settings/applications. Use any URL for the homepage URL
#    (http://github.com is fine) and  http://localhost:1410 as the callback url
#
#    Replace your key and secret below.
myapp = oauth_app(appname="github", 
                  key="69aae95c2f70a89128a1", 
                  secret="e277b20224abc22eb0e6e3c60a1610c14ea113f7")

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
gtoken <- config(token = github_token)
req <- with_config(gtoken, GET("https://api.github.com/users/jtleek/repos"))
stop_for_status(req)
content(req)

json1 = content(req)
json2 <- jsonlite::fromJSON(toJSON(json1))
json2[1,1:6]

names(json2)

json2[10,"created_at"]