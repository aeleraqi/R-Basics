# ============================================================
# 08_data_manipulation.R
# R Basics - dplyr Data Manipulation
# Author: Amr Eleraqi | github.com/aeleraqi
# ============================================================

library(dplyr)

# Sample dataset
employees <- data.frame(
  name       = c("Alice","Bob","Charlie","Diana","Eve","Frank","Grace"),
  dept       = c("HR","IT","IT","Finance","HR","Finance","IT"),
  salary     = c(55000,72000,68000,80000,52000,90000,75000),
  years_exp  = c(2,5,4,8,1,10,6),
  rating     = c(4.2,3.8,4.5,4.0,3.5,4.8,4.1),
  stringsAsFactors=FALSE
)

# ── filter() — Select rows ────────────────────────────────────
employees %>% filter(dept == "IT")
employees %>% filter(salary > 70000, rating >= 4.0)

# ── select() — Choose columns ─────────────────────────────────
employees %>% select(name, salary, rating)
employees %>% select(-dept)                  # Drop a column
employees %>% select(starts_with("y"))       # Columns starting with "y"

# ── arrange() — Sort rows ─────────────────────────────────────
employees %>% arrange(salary)               # Ascending
employees %>% arrange(desc(salary))         # Descending
employees %>% arrange(dept, desc(salary))   # Multiple columns

# ── mutate() — Add / transform columns ───────────────────────
employees %>% mutate(
  monthly_salary  = salary / 12,
  senior          = years_exp >= 5,
  performance_pay = salary * (rating / 5) * 0.1
)

# ── summarise() + group_by() — Aggregate ─────────────────────
employees %>%
  group_by(dept) %>%
  summarise(
    count       = n(),
    avg_salary  = mean(salary),
    max_salary  = max(salary),
    avg_rating  = round(mean(rating), 2)
  )

# ── Chaining multiple operations ──────────────────────────────
employees %>%
  filter(years_exp >= 3) %>%
  mutate(bonus = salary * 0.1) %>%
  select(name, dept, salary, bonus) %>%
  arrange(desc(bonus))

# ── count() — Quick frequency tables ─────────────────────────
employees %>% count(dept)
employees %>% count(dept, sort=TRUE)

# ── distinct() — Remove duplicates ───────────────────────────
employees %>% distinct(dept)

# ── rename() — Rename columns ─────────────────────────────────
employees %>% rename(years = years_exp, perf_score = rating)

# ── slice() — Select rows by position ────────────────────────
employees %>% slice(1:3)              # First 3 rows
employees %>% slice_max(salary, n=2)  # Top 2 salaries
employees %>% slice_min(rating, n=2)  # Bottom 2 ratings

# ── across() — Apply function to multiple columns ─────────────
employees %>%
  mutate(across(where(is.numeric), round, 0))
