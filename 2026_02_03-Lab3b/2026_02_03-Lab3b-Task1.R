#score
scores <- c(33,24,54,94,16,89,60,6,77,61,13,44,26,24,73,73,90,39,90,54)


#create table


grade_table <- data.frame(  
  Grade = c("A","B","C","D","E","F"),
  Score_Range = c("90-100","80-89","70-79","60-69","50-59","<=49"),
  Number_of_Students = c(
    sum(scores >= 90 & scores <= 100),
    sum(scores >= 80 & scores <= 89),
    sum(scores >= 70 & scores <= 79),
    sum(scores >= 60 & scores <= 69),
    sum(scores >= 50 & scores <= 59),
    sum(scores <= 49)
    )
)

pass_table <- data.frame(
  Index = 1:length(scores),
  Score = scores,
  Pass = scores > 49
)


print(grade_table)
print(pass_table)

#Check
pass_status <- scores > 49



