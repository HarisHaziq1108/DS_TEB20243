library(ggplot2)
library(class)   
library(caret)   
library(datasets)


# Activity 1

data("Theoph")
head(Theoph)

# Linear regression: Dose ~ Wt
lm_model <- lm(Dose ~ Wt, data = Theoph)

# Model summary
cat("=== Linear Model Summary ===\n")
print(summary(lm_model))

# Plot regression
r1 <- reg_plot <- ggplot(Theoph, aes(x = Wt, y = Dose)) +
  geom_point(color = "blue") +
  geom_smooth(method = "lm", color = "red") +
  labs(title = "Linear Regression of Dose on Weight",
       x = "Weight (kg)", y = "Dose (mg/kg)")
print(r1)

# Save plot
ggsave("Theoph_Dose_vs_Wt_Regression.png", plot = reg_plot, width = 6, height = 5)
cat("Regression plot saved as Theoph_Dose_vs_Wt_Regression.png\n\n")

# Predict Dose for new weights
new_weights <- data.frame(Wt = c(90, 95, 100))
predicted_dose <- predict(lm_model, newdata = new_weights)
cat("Predicted Dose for weights 90, 95, 100 kg:\n")
print(predicted_dose)


# Activity 2

data("ChickWeight")
head(ChickWeight)

# Prepare data: Predict Diet based on weight
ChickWeight$Diet <- as.factor(ChickWeight$Diet)
set.seed(123)

# Split into train/test
train_index <- createDataPartition(ChickWeight$Diet, p = 0.7, list = FALSE)
train_data <- ChickWeight[train_index, ]
test_data  <- ChickWeight[-train_index, ]

# Standardize weight
train_x <- scale(train_data$weight)
test_x <- scale(test_data$weight, center = attr(train_x, "scaled:center"),
                scale = attr(train_x, "scaled:scale"))

train_y <- train_data$Diet
test_y  <- test_data$Diet

# Find optimal K (1 to 15)
accuracy <- numeric()
for (k in 1:15){
  pred <- knn(train = as.matrix(train_x), test = as.matrix(test_x), cl = train_y, k = k)
  accuracy[k] <- sum(pred == test_y)/length(test_y)
}

optimal_k <- which.max(accuracy)
cat("\nOptimal K =", optimal_k, "with accuracy =", max(accuracy), "\n")

# Predict with optimal K
knn_pred <- knn(train = as.matrix(train_x), test = as.matrix(test_x), cl = train_y, k = optimal_k)

# Confusion matrix
conf_mat <- confusionMatrix(knn_pred, test_y)
cat("\n=== Confusion Matrix ===\n")
print(conf_mat)

# Visualize KNN predictions
knn_plot <- ggplot(test_data, aes(x = weight, y = as.numeric(Diet), color = knn_pred)) +
  geom_point(size = 2) +
  labs(title = paste("KNN Predictions (K =", optimal_k, ")"),
       x = "Weight", y = "Diet (numeric)") +
  scale_color_discrete(name = "Predicted Diet")

# Save KNN plot
ggsave("ChickWeight_KNN_Predictions.png", plot = knn_plot, width = 6, height = 5)
cat("KNN prediction plot saved as ChickWeight_KNN_Predictions.png\n")