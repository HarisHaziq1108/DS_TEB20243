#
# LAB8: TITANIC VISUALIZATION & DATA STORY


# --- Load Libraries ---
library(dplyr)
library(ggplot2)
library(janitor)

# --- Load Titanic CSV ---
titanic <- read.csv("E:/Coding/DS_TEB20243/2026_03_09-Lab8b/titanic.csv", stringsAsFactors = FALSE)

# --- Clean column names ---
titanic <- titanic %>% clean_names()  

# --- Handle missing values ---
titanic_clean <- titanic %>%
  mutate(
    age = ifelse(is.na(age), median(age, na.rm = TRUE), age),
    fare = ifelse(is.na(fare), median(fare, na.rm = TRUE), fare)
  )

# ============================================================
# Activity 1: Titanic Visualizations
# ============================================================

# 1️⃣ Bar chart: Survival by Passenger Class
p1 <- ggplot(titanic_clean, aes(x = factor(pclass), fill = factor(survived))) +
  geom_bar(position = "dodge") +
  scale_fill_manual(values = c("red", "green"), labels = c("Died", "Survived")) +
  labs(title = "Survival by Passenger Class",
       x = "Passenger Class", y = "Number of Passengers", fill = "Status") +
  theme_minimal()
print(p1)

# 2️⃣ Boxplot: Fare distribution by Survival
p2 <- ggplot(titanic_clean, aes(x = factor(survived), y = fare, fill = factor(survived))) +
  geom_boxplot() +
  scale_fill_manual(values = c("orange", "lightblue"), labels = c("Died", "Survived")) +
  labs(title = "Fare Distribution by Survival",
       x = "Survived (0 = No, 1 = Yes)", y = "Fare Paid", fill = "Status") +
  theme_minimal()
print(p2)

# 3️⃣ Histogram: Age distribution
p3 <- ggplot(titanic_clean, aes(x = age)) +
  geom_histogram(binwidth = 5, fill = "lightgreen", color = "black") +
  labs(title = "Distribution of Passenger Ages", x = "Age", y = "Count") +
  theme_minimal()
print(p3)


# Activity 2


# Load dataset
data("AirPassengers")

# 1️⃣ Line chart: Monthly Airline Passenger Growth
p4 <- plot(AirPassengers, type = "o", col = "blue",
           main = "Monthly Airline Passenger Growth (1949-1960)",
           xlab = "Year", ylab = "Total Passengers (in thousands)")
abline(reg = lm(AirPassengers ~ time(AirPassengers)), col = "red", lwd = 2)

# 2️⃣ Summary statistics
cat("Summary of AirPassengers dataset:\n")
print(summary(AirPassengers))


# Activity 1
# 1. Class Survival: First Class passengers had higher survival rates than Third Class.
# 2. Fare Influence: Survivors generally paid higher fares.
# 3. Age Distribution: Most passengers were aged 20-40 years.

# Activity 2
# 1. Upward Trend: Airline passenger numbers increased steadily from 1949 to 1960.
# 2. Seasonal Pattern: Peaks occur mid-year every year, indicating busy travel periods.
# 3. Recommendation: Airlines should increase capacity and staff during peak months.