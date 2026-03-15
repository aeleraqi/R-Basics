# ============================================================
# 07_data_frames.R
# R Basics - Working with Data Frames
# Author: Amr Eleraqi | github.com/aeleraqi
# ============================================================

# ── CREATING DATA FRAMES ──────────────────────────────────────
students <- data.frame(
  id      = 1:6,
  name    = c("Alice","Bob","Charlie","Diana","Eve","Frank"),
  age     = c(22, 25, 23, 21, 24, 26),
  grade   = c("A","B","A","C","B","A"),
  score   = c(92.5, 85.0, 91.0, 74.5, 87.0, 93.5),
  stringsAsFactors = FALSE
)

# ── EXPLORING DATA FRAMES ─────────────────────────────────────
head(students)          # First 6 rows
tail(students, 3)       # Last 3 rows
str(students)           # Structure
summary(students)       # Statistical summary
nrow(students)          # 6
ncol(students)          # 5
colnames(students)      # Column names
rownames(students)      # Row names

# ── ACCESSING DATA ────────────────────────────────────────────
students$name           # Name column
students[["score"]]     # Score column
students[1, ]           # First row
students[ ,3]           # Third column
students[2, "name"]     # "Bob"

# ── FILTERING ROWS ────────────────────────────────────────────
students[students$score >= 90, ]         # High scorers
students[students$grade == "A", ]        # Grade A students
students[students$age < 23, ]           # Students under 23

# Multiple conditions
students[students$score >= 85 & students$grade != "C", ]

# ── ADDING / MODIFYING COLUMNS ────────────────────────────────
students$passed     <- students$score >= 75
students$rank_label <- ifelse(students$score >= 90, "Top",
                       ifelse(students$score >= 80, "Mid", "Low"))

# ── REMOVING COLUMNS ──────────────────────────────────────────
students_clean <- students[ , !(names(students) %in% c("rank_label"))]

# ── SORTING ───────────────────────────────────────────────────
students[order(students$score, decreasing=TRUE), ]   # Descending score
students[order(students$grade, students$score), ]    # Multi-column sort

# ── AGGREGATE STATISTICS ──────────────────────────────────────
mean(students$score)                           # Overall mean
tapply(students$score, students$grade, mean)   # Mean by grade

# ── MERGING DATA FRAMES ───────────────────────────────────────
extra <- data.frame(
  id      = 1:6,
  subject = c("Math","Physics","Math","Biology","Chemistry","Math")
)
merged <- merge(students, extra, by="id")
print(merged[, c("name","score","subject")])

# ── RESHAPING ─────────────────────────────────────────────────
# Wide to long format
library(tidyr)
wide_df <- data.frame(
  student = c("Alice","Bob"),
  math    = c(90, 85),
  english = c(88, 92)
)
long_df <- pivot_longer(wide_df, cols=c(math, english),
                         names_to="subject", values_to="score")
print(long_df)
