# ============================================================
# 05_functions.R
# R Basics - Functions
# Author: Amr Eleraqi | github.com/aeleraqi
# ============================================================

# ── DEFINING FUNCTIONS ────────────────────────────────────────
greet <- function(name) {
  paste("Hello,", name, "!")
}
cat(greet("Amr"), "\n")
cat(greet("World"), "\n")

# ── DEFAULT ARGUMENTS ─────────────────────────────────────────
power <- function(base, exponent = 2) {
  base ^ exponent
}
power(3)       # 9  — uses default exponent=2
power(3, 3)    # 27

# ── MULTIPLE RETURN VALUES (via list) ─────────────────────────
stats <- function(x) {
  list(
    mean   = mean(x),
    median = median(x),
    sd     = sd(x),
    range  = range(x)
  )
}
result <- stats(c(10, 20, 30, 40, 50))
cat("Mean:",   result$mean,   "\n")
cat("Median:", result$median, "\n")
cat("SD:",     result$sd,     "\n")

# ── ... (DOT-DOT-DOT) — VARIABLE ARGS ─────────────────────────
my_sum <- function(...) {
  args <- c(...)
  sum(args)
}
my_sum(1, 2, 3)          # 6
my_sum(10, 20, 30, 40)   # 100

# ── ANONYMOUS FUNCTIONS ───────────────────────────────────────
square   <- function(x) x ^ 2
cube     <- function(x) x ^ 3

sapply(1:5, square)   # 1  4  9 16 25
sapply(1:5, cube)     # 1  8 27 64 125

# R 4.1+ shorthand
sq <- \(x) x^2
sq(7)   # 49

# ── RECURSIVE FUNCTIONS ───────────────────────────────────────
factorial_r <- function(n) {
  if (n <= 1) return(1)
  n * factorial_r(n - 1)
}
factorial_r(5)   # 120
factorial_r(10)  # 3628800

# Fibonacci
fibonacci <- function(n) {
  if (n <= 1) return(n)
  fibonacci(n-1) + fibonacci(n-2)
}
sapply(0:10, fibonacci)  # 0 1 1 2 3 5 8 13 21 34 55

# ── SCOPE: GLOBAL vs LOCAL ────────────────────────────────────
x <- "global"

modify <- function() {
  x <- "local"   # creates a LOCAL x, does not change global
  cat("Inside function, x =", x, "\n")
}
modify()
cat("Outside function, x =", x, "\n")  # still "global"

# Use <<- to assign to global scope
counter <- 0
increment <- function() {
  counter <<- counter + 1
}
increment(); increment(); increment()
cat("Counter:", counter, "\n")  # 3
