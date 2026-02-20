#user input
Name <- readline("Enter name: ")
Phone <- readline("Enter phone number:")

#Convert name to uppercase
Name_Upper <- toupper(Name)

#Extract phone num
first3 <- substr(Phone, 1,3)
last4 <- substr(Phone, nchar(Phone)-3, nchar(Phone))

#output
cat("Hi", Name ,". A verification code has been sent to ", first3, "-xxxxx", last4 )