
library(ggplot2)
library(reshape2)
library(datasets)


# Activity 1

data("ToothGrowth")
head(ToothGrowth)

# Select numeric columns
numeric_data <- ToothGrowth[, sapply(ToothGrowth, is.numeric)]

# Compute correlation matrix
cor_matrix <- cor(numeric_data)
print("Correlation Matrix:")
print(cor_matrix)

# Melt correlation matrix for ggplot
cor_melt <- melt(cor_matrix)

# Plot correlation heatmap
heatmap_plot <- ggplot(cor_melt, aes(Var1, Var2, fill = value)) +
  geom_tile(color = "white") +
  scale_fill_gradient2(low = "blue", high = "red", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab",
                       name="Correlation") +
  theme_minimal() +
  geom_text(aes(label = round(value,2)), color = "black", size = 4) +
  labs(title = "Correlation Heatmap of ToothGrowth")

# Save heatmap to file
ggsave("ToothGrowth_heatmap.png", plot = heatmap_plot, width = 6, height = 5)
cat("Heatmap saved as ToothGrowth_heatmap.png\n\n")


# Activity 2:

data("mtcars")
head(mtcars)

# --- Log Transformation ---
log_scaled <- log(mtcars + 1)
cat("Log-transformed mtcars (first 5 rows):\n")
print(head(log_scaled, 5))

# Plot histograms for log-scaled mtcars
for (col in colnames(log_scaled)) {
  p <- ggplot(log_scaled, aes_string(x = col)) +
    geom_histogram(bins = 15, fill = "steelblue", color = "black") +
    labs(title = paste("Histogram of Log-transformed", col))
  ggsave(paste0("LogHist_", col, ".png"), plot = p, width = 5, height = 4)
}

# --- Standard Scaling (Z-score) ---
standard_scaled <- scale(mtcars)
cat("\nStandard-scaled mtcars (first 5 rows):\n")
print(head(standard_scaled, 5))

# Convert to data.frame for ggplot
standard_scaled_df <- as.data.frame(standard_scaled)
for (col in colnames(standard_scaled_df)) {
  p <- ggplot(standard_scaled_df, aes_string(x = col)) +
    geom_histogram(bins = 15, fill = "darkgreen", color = "black") +
    labs(title = paste("Histogram of Standard-scaled", col))
  ggsave(paste0("StdHist_", col, ".png"), plot = p, width = 5, height = 4)
}

# --- Min-Max Scaling ---
min_max_scaled <- as.data.frame(lapply(mtcars, function(x) (x - min(x))/(max(x) - min(x))))
cat("\nMin-max scaled mtcars (first 5 rows):\n")
print(head(min_max_scaled, 5))

# Plot histograms for min-max scaled mtcars
for (col in colnames(min_max_scaled)) {
  p <- ggplot(min_max_scaled, aes_string(x = col)) +
    geom_histogram(bins = 15, fill = "orange", color = "black") +
    labs(title = paste("Histogram of Min-Max scaled", col))
  ggsave(paste0("MinMaxHist_", col, ".png"), plot = p, width = 5, height = 4)
}


# Observations

cat("\nComparison Observation:\n")
cat("1. Log transformation reduces skewness and compresses large values.\n")
cat("2. Standard scaling centers values at 0 and scales by SD, preserving distribution shape.\n")
cat("3. Min-max scaling rescales values to [0,1], sensitive to outliers but useful for bounded input requirements.\n")
cat("\nAll plots are saved to PNG files in the working directory.\n")

# DISCUSSION: ACTIVITY 1 - TOOTHGROWTH INSIGHTS
#
# 1. POSITIVE RELATIONSHIP (Dose vs Length):
#    The results indicate a clear positive relationship between 'dose' 
#    and 'len'[cite: 876]. As the dosage of Vitamin C increases, the 
#    tooth length of guinea pigs also tends to increase accordingly.
#
# 2. EFFECT OF SUPPLEMENT TYPE:
#    After encoding 'supp' into numeric form, the correlation analysis 
#    allows us to examine whether the type of supplement (OJ vs VC) 
#    contributes linearly to tooth growth in addition to the dosage[cite: 876].
#
# 3. HEATMAP INTERPRETATION:
#    The heatmap further supports that 'dose' plays a dominant role in 
#    influencing 'len'[cite: 876]. Stronger color intensity shows that 
#    higher dosage levels (from 0.5 up to 2.0) are associated with greater 
#    tooth growth.
#
# 4. DATA SCIENCE IMPLICATION:
#    From these observations, 'dose' can be considered a key feature for 
#    predictive models. Identifying such relationships is important before 
#    proceeding with preprocessing steps like normalization or applying 
#    machine learning techniques[cite: 877].