library(dplyr)
library(xlsx)

titanic <- read.csv("E:/Coding/DS_TEB20243/2026_03_02-Lab7b/titanic.csv")
View(titanic)

#to count the total NA values
sum(is.na(titanic))

#get the positions of the NA values
which(is.na(titanic))

#get count of NA in each column 
print(sapply(titanic, function(x) sum(is.na(x))))

dim(titanic)
titanic_cleaned = na.omit(titanic)
dim(titanic_cleaned)

colnames(titanic_cleaned)
names(titanic_cleaned)
names(titanic_cleaned) = gsub(" ", "_",colnames(titanic_cleaned))
names(titanic_cleaned)

print(filter(titanic_cleaned,Sex == 'female')) 
print(filter(titanic_cleaned,Fare > 500)) 

print(filter(titanic_cleaned,Sex == 'female' & Fare > 500)) 

#sort by ascending order
titanic_sortbyfare = arrange(titanic_cleaned, Fare)
titanic_sortbyfare = arrange(titanic_cleaned, desc(Fare))

#save 
write.csv(titanic_sortbyfare,"titanic_sortbyfare.csv")


