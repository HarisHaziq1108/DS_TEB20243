#Input
year <- as.numeric(readline("Input year: "))

#Check if leap year
if((year %% 4 == 0 && year %% 100 != 0) || (year %% 400 == 0)){
  cat("Output: ",year, "is a leap year.")
}else{
  cat("Output:",year, "is not a leap year.")
}
