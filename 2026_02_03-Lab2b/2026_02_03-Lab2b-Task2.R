#User input
str1 <- readline("Enter first String: ")
str2 <- readline("Enter second String: ")

#Compare
compare <- (tolower(str1) == tolower(str2))
cat("\nThis program compare 2 string. Both inputs are similar: ", compare)
