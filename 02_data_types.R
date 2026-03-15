# ============================================================
# 02_data_types.R
# R Basics - Data Types and Structures
# Author: Amr Eleraqi | github.com/aeleraqi
# ============================================================

# ── VECTORS ──────────────────────────────────────────────────
# A vector is the most basic data structure in R — a sequence of values

nums   <- c(1, 2, 3, 4, 5)
chars  <- c("apple", "banana", "cherry")
logics <- c(TRUE, FALSE, TRUE, TRUE)

# Accessing elements (1-indexed in R!)
nums[1]        # 1 — first element
nums[2:4]      # 2 3 4 — elements 2 to 4
nums[c(1,3,5)] # 1 3 5 — specific elements

# Vector operations (applied element-wise)
nums * 2        # 2 4 6 8 10
nums + 10       # 11 12 13 14 15
nums > 3        # FALSE FALSE FALSE TRUE TRUE

# Useful vector functions
length(nums)   # 5
sum(nums)      # 15
mean(nums)     # 3
max(nums)      # 5
min(nums)      # 1
rev(nums)      # 5 4 3 2 1
sort(c(3,1,4,1,5,9,2,6))  # 1 1 2 3 4 5 6 9

# Named vectors
scores <- c(math=95, english=88, science=92)
scores["math"]   # 95

# ── SEQUENCES ────────────────────────────────────────────────
1:10                        # 1 2 3 ... 10
seq(0, 1, by=0.25)          # 0.00 0.25 0.50 0.75 1.00
seq(1, 100, length.out=5)   # 1 25.75 50.5 75.25 100
rep(0, times=5)             # 0 0 0 0 0
rep(c(1,2), times=3)        # 1 2 1 2 1 2
rep(c(1,2), each=3)         # 1 1 1 2 2 2

# ── FACTORS ──────────────────────────────────────────────────
# Factors represent categorical data
gender <- factor(c("Male","Female","Male","Female","Male"))
levels(gender)    # "Female" "Male"
table(gender)     # counts per level

# Ordered factor (e.g. ratings)
rating <- factor(c("Low","High","Medium","Low","High"),
                 levels=c("Low","Medium","High"),
                 ordered=TRUE)
rating[1] < rating[2]   # TRUE — Low < High

# ── LISTS ────────────────────────────────────────────────────
# Lists can hold different types
person <- list(
  name   = "Amr Eleraqi",
  age    = 35,
  skills = c("Python","R","NLP"),
  active = TRUE
)

person$name       # "Amr Eleraqi"
person[["age"]]   # 35
person$skills[1]  # "Python"

# ── MATRICES ─────────────────────────────────────────────────
m <- matrix(1:9, nrow=3, ncol=3)
print(m)
#      [,1] [,2] [,3]
# [1,]    1    4    7
# [2,]    2    5    8
# [3,]    3    6    9

m[2, 3]       # Row 2, Col 3 → 8
m[1, ]        # Entire row 1
m[ ,2]        # Entire column 2
t(m)          # Transpose

# ── DATA FRAMES ──────────────────────────────────────────────
# The most used structure — like a spreadsheet
df <- data.frame(
  name    = c("Alice","Bob","Charlie","Diana"),
  age     = c(25, 30, 35, 28),
  score   = c(88.5, 92.0, 79.5, 95.0),
  passed  = c(TRUE, TRUE, TRUE, TRUE)
)

print(df)
nrow(df)          # 4 rows
ncol(df)          # 4 columns
dim(df)           # 4 4
str(df)           # Structure overview
summary(df)       # Statistical summary

df$name           # Name column as vector
df[1, ]           # First row
df[df$score > 90, ]  # Filter rows where score > 90
