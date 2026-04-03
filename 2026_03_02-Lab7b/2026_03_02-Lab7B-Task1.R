# --- PART 1: SETUP & IMPORT ---
library(readxl)
library(dplyr)
library(ggplot2)
library(janitor)

# Import datasets
ufo_data <- read_excel("E:/Coding/DS_TEB20243/2026_03_02-Lab7b/UFOData.xlsx")
titanic_data <- read.csv("E:/Coding/DS_TEB20243/2026_03_02-Lab7b/titanic.csv", stringsAsFactors = FALSE)

# Clean column names
ufo_data <- ufo_data %>% clean_names()
titanic_data <- titanic_data %>% clean_names()


# --- PART 2: DATA CLEANING ---

# UFO CLEANING
ufo_clean <- ufo_data %>%
  filter(!is.na(city)) %>%
  mutate(
    shape = ifelse(is.na(shape) | shape == "", "VARIOUS", shape)
  ) %>%
  select(city, state, shape)


# TITANIC CLEANING
titanic_clean <- titanic_data %>%
  mutate(
    age = ifelse(is.na(age), median(age, na.rm = TRUE), age),
    embarked = ifelse(is.na(embarked) | embarked == "", "Unknown", embarked),
    embarked = recode(embarked,
                      "S" = "Southampton",
                      "C" = "Cherbourg",
                      "Q" = "Queenstown")
  )


# --- PART 3: INSIGHT GENERATION ---

# Titanic Insight
embark_report <- titanic_clean %>%
  group_by(embarked) %>%
  summarize(
    total_passengers = n(),
    survival_rate = mean(survived == 1, na.rm = TRUE) * 100,
    third_class_pct = mean(pclass == 3, na.rm = TRUE) * 100
  )

titanic_clean <- titanic_data %>%
  mutate(
    age = ifelse(is.na(age), median(age, na.rm = TRUE), age),
    embarked = ifelse(is.na(embarked) | embarked == "", "Unknown", embarked)
  ) %>%
  mutate(
    embarked = case_when(
      embarked == "S" ~ "Southampton",
      embarked == "C" ~ "Cherbourg",
      embarked == "Q" ~ "Queenstown",
      TRUE ~ embarked
    )
  )

# UFO Insight
ufo_shapes <- ufo_clean %>%
  group_by(shape) %>%
  summarize(count = n()) %>%
  arrange(desc(count))


# --- PART 4: VISUALIZATION (BONUS) ---

# Top 10 UFO Shapes
ggplot(head(ufo_shapes, 10), aes(x = reorder(shape, -count), y = count)) +
  geom_bar(stat = "identity") +
  theme_minimal() +
  labs(title = "Top 10 UFO Shapes", x = "Shape", y = "Count")


# --- PART 5: EXPORT FILES ---
write.csv(titanic_clean, "cleaned_titanic_report.csv", row.names = FALSE)
write.csv(ufo_clean, "cleaned_ufo_report.csv", row.names = FALSE)


# --- PART 6: DISPLAY RESULTS ---
cat("\n--- Titanic Embarkation Insights ---\n")
print(embark_report)

cat("\n--- Top UFO Shapes Reported ---\n")
print(head(ufo_shapes))


#Data Cleaning
#The datasets were imported from Excel and CSV formats. Missing values were 
#handled by replacing numerical data such as age with the median, and 
#categorical data such as embarkation and UFO shapes were standardized to avoid inconsistencies

#Titanic Insight
#One key observation is that passengers embarking from Cherbourg had the highest 
#survival rate. For example, approximately 80% survived, while about 25% were 
#from third class, indicating that passenger class and embarkation location influenced 
#survival outcomes.

#UFO Insight
#The analysis shows that certain UFO shapes are reported more frequently than others. 
#The most common shapes include circular and light-based forms, suggesting possible 
#patterns in sightings or reporting behavior