# LOAD DATA 
df_raw <- read_lines(
  "E:/Assignment/2nd 2nd/cs/Unclean Dataset.csv",
  locale = locale(encoding = "UTF-8")
)

df_raw <- data.frame(raw = df_raw, stringsAsFactors = FALSE)

# SPLIT
df <- df_raw %>%
  separate(
    raw,
    into = c("student_id","first_name","last_name","age","gender",
             "course","enrollment_date","total_payments"),
    sep = "\\|",
    fill = "right"
  )


# CLEANING
df <- df %>%
  clean_names() %>%
  mutate(across(everything(), str_trim)) %>%     # remove spaces
  mutate(across(everything(), ~na_if(.x, "NA"))) # real NA


# TYPE FIXING
df <- df %>%
  mutate(
    student_id = as.integer(student_id),
    age = as.integer(age),
    enrollment_date = as.Date(enrollment_date),
    total_payments = str_remove_all(total_payments, "[$,]"),
    total_payments = as.numeric(total_payments)
  )

# STANDARDIZATION
df <- df %>%
  mutate(
    gender = case_when(
      gender %in% c("M","m","male","Male") ~ "Male",
      gender %in% c("F","f","female","Female") ~ "Female",
      TRUE ~ NA_character_
    ),
    course = str_to_title(course)
  )


# REMOVE DUPLICATES
df <- df %>% distinct()

# HANDLE MISSING VALUES
df_clean <- df %>% drop_na()


# VALIDATION
str(df_clean)
summary(df_clean)
head(df_clean)


# SAVE CLEAN DATA


write_csv(df_clean, "E:/Assignment/2nd 2nd/cs/Clean_Dataset.csv")

cat("\nData cleaning complete!\n")
cat("Saved to: E:/Assignment/2nd 2nd/cs/Clean_Dataset.csv\n")