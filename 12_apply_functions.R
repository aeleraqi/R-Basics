# ============================================================
# 12_apply_functions.R
# R Basics - The apply Family (Vectorized Operations)
# Author: Amr Eleraqi | github.com/aeleraqi
# ============================================================

# ── apply() — for matrices/arrays ────────────────────────────
m <- matrix(1:12, nrow=3)
apply(m, 1, sum)   # Row sums:    6 22 38... (MARGIN=1 → rows)
apply(m, 2, sum)   # Column sums: 6 22 38... (MARGIN=2 → cols)
apply(m, 1, mean)
apply(m, 2, max)

# ── lapply() — returns a LIST ──────────────────────────────────
nums_list <- list(a=1:5, b=10:15, c=c(2,4,6,8))
lapply(nums_list, mean)    # List of means
lapply(nums_list, length)  # List of lengths
lapply(nums_list, function(x) x^2)  # Square each element

# ── sapply() — returns a VECTOR (simplified lapply) ───────────
sapply(nums_list, mean)    # Named numeric vector
sapply(nums_list, length)  # c(a=5, b=6, c=4)
sapply(1:5, function(x) x^2)  # 1 4 9 16 25

# ── tapply() — apply by GROUP ──────────────────────────────────
data(mtcars)
tapply(mtcars$mpg, mtcars$cyl, mean)    # Mean MPG by cylinders
tapply(mtcars$hp,  mtcars$gear, max)    # Max HP by gear count

# ── vapply() — like sapply but TYPE-SAFE ──────────────────────
vapply(nums_list, mean, numeric(1))     # Guaranteed numeric output

# ── mapply() — MULTIVARIATE sapply ───────────────────────────
mapply(function(x, y) x + y, 1:4, 5:8)  # 6 8 10 12

# Practical: Create labeled strings
mapply(function(name, score) paste(name, "scored", score),
       c("Alice","Bob","Charlie"),
       c(92, 85, 78))

# ── Functional programming with purrr ─────────────────────────
library(purrr)

map(1:5, ~.x^2)              # List of squares (like lapply)
map_dbl(1:5, ~.x^2)          # Numeric vector (like sapply)
map_chr(1:3, ~paste("Item", .x))  # Character vector

# Filter and reduce
keep(1:10, ~.x %% 2 == 0)    # Keep even: 2 4 6 8 10
discard(1:10, ~.x > 5)       # Discard >5: 1 2 3 4 5
reduce(1:5, `+`)              # 15 — sum by folding left
