#create list
Students <- list(
  Robert = 59, 
  Hemsworth = 71, 
  Scarlett = 83,
  Evans = 68,
  Pratt = 65,
  Larson = 57,
  Holland = 62,
  Paul = 92,
  Simu = 92,
  Renner = 59
)

scores <- unlist(Students)

#calc
Highest <- max(scores)
Lowest <- min(scores)
Avg <- mean(scores)

highest_student <- names(scores[scores == Highest])
lowest_student <- names(scores[scores == Lowest])

#output
cat("Highest score: ", Highest,"\n")
cat("Lowest score: ", Lowest,"\n")
cat("Average Score: ", Avg, "\n")
cat("Student with highest score: ", highest_student, "\n")
cat("Student with lowest score: ", lowest_student, "\n")