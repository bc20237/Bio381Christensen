#dplyr
iris
glimpse(iris)
#core verbs
#filter(): pick or subset obs by their values (rows)
#arrange(): reorder
#select(): choose variables (columns) by names
#mutate(): creating new variables with functions of existing variables
#summarize() and group_by(): collapses many values into a single summary
data(starwars)
class(starwars)
#tbl = tibble 
glimpse(starwars)
starwarsClean<-starwars[complete.cases(starwars[,1:10]),]
#complete cases- cleans up data, gets rid of anything with missings 
anyNA(starwarsClean)

#case_when(): useful for multiple if-else statements 
