# Create list

Students <- list(
  Robert   = c(Chemistry = 59, Physics = 89), 
  Hemsworth= c(Chemistry = 71, Physics = 86), 
  Scarlett = c(Chemistry = 83, Physics = 65),
  Evans    = c(Chemistry = 68, Physics = 52),
  Pratt    = c(Chemistry = 65, Physics = 60),
  Larson   = c(Chemistry = 57, Physics = 67),
  Holland  = c(Chemistry = 62, Physics = 40),
  Paul     = c(Chemistry = 92, Physics = 77),
  Simu     = c(Chemistry = 92, Physics = 90),
  Renner   = c(Chemistry = 59, Physics = 61)
)

# Extract scores

chem_score <- sapply(Students, function(x) x["Chemistry"])
phy_score  <- sapply(Students, function(x) x["Physics"])


# Fail count

chem_fail <- sum(chem_score <= 49)
phy_fail  <- sum(phy_score <= 49)


# Highest scores

best_chem <- max(chem_score)
best_phy  <- max(phy_score)

best_chem_students <- names(chem_score[chem_score == best_chem])
best_phy_students  <- names(phy_score[phy_score == best_phy])
best_chem_students <- sub("\\.Chemistry", "", best_chem_students)
best_phy_students  <- sub("\\.Physics", "", best_phy_students)

# Output

cat("Chemistry fail count: ", chem_fail, "\n")
cat("Physics fail count: ", phy_fail, "\n\n")

cat("Highest Chemistry score: ", best_chem, "\n")
cat("Top student(s) in Chemistry: ", paste(best_chem_students, collapse = ", "), "\n\n")

cat("Highest Physics score: ", best_phy, "\n")
cat("Top student(s) in Physics: ", paste(best_phy_students, collapse = ", "), "\n")