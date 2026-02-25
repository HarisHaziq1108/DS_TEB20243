#create table

Name <- c("Anastasia", "Dimia", "Michael", "Matthew", "Laura", "Kevin", "Jonas")
Score <- c(12.5, 9.0, 16.5, 12.0, 9.0, 8.0, 19.0 )
Attempts <- c(1,3,2,3,2,1,2)

df <- data.frame(Name,Score,Attempts)
df$Qualify <- c("Yes", "No", "Yes", "No", "No", "No", "Yes")

NewRow <- data.frame(
  Name = "Emily",
  Score = 14.5,
  Attempts = 1,
  Qualify = "Yes"
)

df <- rbind(df, NewRow)

View(df)
