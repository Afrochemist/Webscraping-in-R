#libraries
library(rvest)
library(stringr)



#the website
url = "https://www.washingtonpost.com/news/the-fix/wp/2016/09/26/the-first-trump-clinton-presidential-debate-transcript-annotated/?utm_term=.3c85488e1e91"


t_link = read_html(url)

#to extract the revelant html tag for the transcript
transcript = t_link %>% html_nodes("#main-content") %>% html_text()

#to look at the variable
head(transcript)



#we have 3 different patterns/speakers to search for
#which will include in our expression using the or operator "|"
#str_locate_all of stringr will give the index (start and end position)
markers <- str_locate_all(transcript, pattern = "CLINTON|TRUMP|HOLT")


head(markers)

