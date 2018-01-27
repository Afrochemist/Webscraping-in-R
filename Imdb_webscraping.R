#Webscraping with IMDB

#libraries
library(rvest)

#the website
url = "https://www.imdb.com/search/title?year=2017&title_type=feature&"

#Reading the HTML code from the website
webpage = read_html(url)

#CSS selectors to scrap the rankings selection
rank_data_html = html_nodes(webpage, '.text-primary')

class(rank_data_html)

#Converting the ranking data to text
rank_data = html_text(rank_data_html)


#Lets have a look at the rankings
head(rank_data)
class(rank_data)


#Convert to numerical format
rank_data = as.numeric(rank_data)

head(rank_data)
class(rank_data)

#Using CSS selectors to scrap the title section
title_data_html = html_nodes(webpage,'.lister-item-header a')

#Converting the title data to text
title_data = html_text(title_data_html)

#Let's have a look at the top titles
head(title_data)


#Using the CSS selectors to scrap the Movie runtime section
runtime_data_html = html_nodes(webpage,' .runtime')

#Converting the runtime data to text
runtime_data = html_text(runtime_data_html)

head(runtime_data)

#converting the the text to nuermical values
runtime_data = gsub(" min","",runtime_data)
runtime_data=as.numeric(runtime_data)

head(runtime_data)

#looking at a different selector
genre_data_html = html_nodes(webpage, '.genre')

#converting the genre data to text
genre_data = html_text(genre_data_html)

head(genre_data)


genre_data=gsub("\n","",genre_data)

#Data-Preprocessing: removing excess spaces
genre_data = gsub(" ","",genre_data)

#converting each genre from text to factor
genre_data=as.factor(genre_data)

head(genre_data)