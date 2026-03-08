cat("Check whether an n digits number is Armstrong or not:\n")
cat("-----------------------------------------------------\n")

number <- as.numeric(readline("Input an integer: "))

#convert number into digits
digits <- strsplit(as.character(number), "")[[1]]
digits <- as.numeric(digits)

#number of digits
n <- length(digits)

#calculate Armstrong sum
sum <- 0
for (d in digits) {
  sum <- sum + d^n
}

#check result
if (sum == number) {
  cat(number, "is an Armstrong number.")
} else {
  cat(number, "is not an Armstrong number.")
}