V1 = c(2,3,1,5,4,6,8,7,9)

#matrix 1
Matrix1 <- matrix(V1, nrow = 3, ncol = 3)
print(Matrix1)

#transpose -> matrix 2
Matrix2 <- t(Matrix1)
print(Matrix2)

#rename
rownames(Matrix1) <- c("R1","R2","R3")
colnames(Matrix1) <- c("C1","C2","C3")

rownames(Matrix2) <- c("R1","R2","R3")
colnames(Matrix2) <- c("C1","C2","C3")

#addition
Matrix1 + Matrix2
#subtrac
Matrix1 - Matrix2
#Multi
Matrix1 * Matrix2
#division 
Matrix1/Matrix2
