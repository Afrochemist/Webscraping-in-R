####First webscraping script

#libraries
library(RCurl)
library(XML)

#The site I will scrap data from 
url = "https://en.wikipedia.org/wiki/2016_Summer_Olympics_medal_table"

urldata <- getURL(url)

#read the HTML table
data <- readHTMLTable(urldata, stringsAsFactors = FALSE)



names(data)
head(data)