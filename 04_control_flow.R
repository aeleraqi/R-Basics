# ============================================================
# 04_control_flow.R
# R Basics - Control Flow
# Author: Amr Eleraqi | github.com/aeleraqi
# ============================================================

# ── IF / ELSE IF / ELSE ───────────────────────────────────────
score <- 78

if (score >= 90) {
  cat("Grade: A\n")
} else if (score >= 80) {
  cat("Grade: B\n")
} else if (score >= 70) {
  cat("Grade: C\n")
} else {
  cat("Grade: F\n")
}

# Inline ifelse() — vectorized version
scores <- c(95, 72, 88, 60, 91)
grades <- ifelse(scores >= 90, "A",
          ifelse(scores >= 80, "B",
          ifelse(scores >= 70, "C", "F")))
cat("Grades:", grades, "\n")

# ── FOR LOOPS ─────────────────────────────────────────────────
# Basic for loop
for (i in 1:5) {
  cat("Iteration:", i, "\n")
}

# Loop over a vector
fruits <- c("apple", "banana", "cherry")
for (fruit in fruits) {
  cat("I like", fruit, "\n")
}

# Loop to build a result
squares <- c()
for (n in 1:10) {
  squares <- c(squares, n^2)
}
cat("Squares:", squares, "\n")

# ── WHILE LOOPS ───────────────────────────────────────────────
count <- 1
while (count <= 5) {
  cat("Count:", count, "\n")
  count <- count + 1
}

# ── REPEAT + BREAK ────────────────────────────────────────────
x <- 0
repeat {
  x <- x + 1
  if (x >= 5) break
}
cat("x stopped at:", x, "\n")

# ── NEXT (like continue in Python) ────────────────────────────
for (i in 1:10) {
  if (i %% 2 == 0) next  # skip even numbers
  cat(i, "")
}
cat("\n")  # odd numbers: 1 3 5 7 9

# ── switch() ──────────────────────────────────────────────────
day_type <- function(day) {
  switch(day,
    "Monday"    = , "Tuesday" = , "Wednesday" = ,
    "Thursday"  = , "Friday"  = "Weekday",
    "Saturday"  = , "Sunday"  = "Weekend",
    "Unknown"
  )
}
cat(day_type("Monday"),   "\n")  # Weekday
cat(day_type("Saturday"), "\n")  # Weekend
