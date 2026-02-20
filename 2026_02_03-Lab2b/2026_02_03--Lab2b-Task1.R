# Input
weight <- as.numeric(readline("Enter your weight (kg): "))
height <- as.numeric(readline("Enter your height (cm): "))

# BMI Calculation
height_m <- height/100
bmi <- weight / (height_m^2)

# Category Determination
if (bmi < 18.5) {
  status <- "Underweight"
} else if (bmi >= 18.5 && bmi <= 24.9) {
  status <- "Normal"
} else if (bmi >= 25 && bmi <= 29.9) {
  status <- "Overweight"
} else {
  status <- "Obese"
}

# Output
cat("\nYour BMI is:", round(bmi, 2), "\n")
cat("Status:", status, "\n")