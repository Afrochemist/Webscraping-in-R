#Amazon

#libraries
library(rvest)
library(stringr)
library(XML)

#Removes the white space
trim <- function (x) gsub("^\\s+|\\s+$", "", x)

prod_code = "BO6X3Z9MF3"

url <- paste0("https://www.amazon.com/dp/", prod_code)
doc <- read_html(url)


#obtain the text in the node, remove "\n" from the text, and remove white space
prod <- html_nodes(doc, "productTitle") %>% html_text() %>% gsub("\n", "", .) %>% trim()

#look at the result
prod

url_amazon <- "https://www.amazon.com.in/s/ref=bl_dp_s_web_976392031?ie=UTF8&node=976392031&field-brandtextbin=Transcend"


#using rvest
Amazon_Normal_Text <- url_amazon %>%
  read_html() %>%
  html_nodes(".a-text-normal") %>%
  html_text()

#looking at the text
head(Amazon_Normal_Text)