# ============================================================
# 03_operators.R
# R Basics - Operators
# Author: Amr Eleraqi | github.com/aeleraqi
# ============================================================

# ── ARITHMETIC OPERATORS ──────────────────────────────────────
5 + 3      # 8   — addition
5 - 3      # 2   — subtraction
5 * 3      # 15  — multiplication
5 / 3      # 1.666... — division
5 ^ 2      # 25  — power
5 %% 3     # 2   — modulo
5 %/% 3    # 1   — integer division

# ── COMPARISON OPERATORS ─────────────────────────────────────
5 == 5     # TRUE   — equal to
5 != 3     # TRUE   — not equal
5 > 3      # TRUE   — greater than
5 < 3      # FALSE  — less than
5 >= 5     # TRUE   — greater or equal
5 <= 4     # FALSE  — less or equal

# ── LOGICAL OPERATORS ─────────────────────────────────────────
TRUE & FALSE    # FALSE  — AND
TRUE | FALSE    # TRUE   — OR
!TRUE           # FALSE  — NOT
TRUE && FALSE   # FALSE  — short-circuit AND (scalars only)
TRUE || FALSE   # TRUE   — short-circuit OR  (scalars only)

# ── SPECIAL OPERATORS ─────────────────────────────────────────
# %in% — membership test
"apple" %in% c("apple","banana","cherry")   # TRUE
5 %in% 1:10                                 # TRUE

# %% and %/% on vectors
c(10,11,12) %% 3    # 1 2 0
c(10,11,12) %/% 3   # 3 3 4

# ── ASSIGNMENT OPERATORS ──────────────────────────────────────
x <- 10     # preferred
x  = 10     # also valid
10 -> x     # right-assignment (uncommon)

# ── PRACTICAL EXAMPLES ────────────────────────────────────────
ages <- c(15, 22, 17, 30, 14, 25)

# Who is an adult?
adults <- ages[ages >= 18]
cat("Adults:", adults, "\n")

# Are ALL adults?
all(ages >= 18)   # FALSE

# Are ANY adults?
any(ages >= 18)   # TRUE

# Count adults
sum(ages >= 18)   # 3
