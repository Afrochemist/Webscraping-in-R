


#libraries
library(XML)
library(RCurl)
library(rvest)
library(stringr)
library(tidyr)


#The location i will scrap data from
url <- "http://espn.go.com/nfl/superbowl/history/winners"
webpage = read_html(url)

sb_table = html_nodes(webpage, 'table')
#accessing the first page
sb = html_table(sb_table)[[1]]
head(sb)



#preliminary processing:remove the first two rows, and set the columns
sb = sb[-(1:2), ]
names(sb) = c('number', 'date', 'site', 'result')
head(sb)

#separating the winners and losers
sb = separate(sb, result, c('winner', 'loser'), sep=', ', remove=TRUE)
head(sb)


#we split off the scores from the winner and loser columns.
#The function str_extract from the stringr package finds a 
#substring matching a pattern

pattern = " \\d+$"
sb$winnerScore = as.numeric(str_extract(sb$winner, pattern))
sb$loseScore = as.numeric(str_extract(sb$loser, pattern))
sb$winner = gsub(pattern, "", sb$winner)
sb$loser = gsub(pattern, "", sb$loser)
head(sb)
