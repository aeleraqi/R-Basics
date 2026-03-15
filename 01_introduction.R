# ============================================================
# 01_introduction.R
# R Basics - Getting Started
# Author: Amr Eleraqi | github.com/aeleraqi
# ============================================================

# --- Comments ---
# Lines starting with # are comments — R ignores them.
# Use comments to explain your code.

# --- Printing output ---
print("Hello, R!")          # Explicit print
cat("Hello again!\n")       # cat() prints without quotes

# --- Variables ---
# Use <- (preferred) or = to assign values
name   <- "Amr"
age    <- 35
height <- 1.75
is_student <- FALSE

# Print variables
print(name)
cat("Age:", age, "\n")

# --- Check data type ---
class(name)        # "character"
class(age)         # "numeric"
class(is_student)  # "logical"

# --- Basic arithmetic ---
x <- 10
y <- 3

x + y    # 13  — addition
x - y    # 7   — subtraction
x * y    # 30  — multiplication
x / y    # 3.33 — division
x %% y   # 1   — modulo (remainder)
x %/% y  # 3   — integer division
x ^ y    # 1000 — exponentiation

# --- Useful built-in functions ---
sqrt(144)       # 12
abs(-42)        # 42
round(3.14159, 2)  # 3.14
ceiling(2.3)    # 3
floor(2.9)      # 2
log(100, 10)    # 2  — log base 10
exp(1)          # 2.718 — Euler's number

# --- Getting help ---
?sqrt           # Open help page for sqrt
help("mean")    # Same as ?mean
