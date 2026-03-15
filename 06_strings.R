# ============================================================
# 06_strings.R
# R Basics - String Manipulation
# Author: Amr Eleraqi | github.com/aeleraqi
# ============================================================

# ── BASE R STRING FUNCTIONS ───────────────────────────────────
s <- "Hello, R Programming!"

nchar(s)                    # 21 — string length
toupper(s)                  # "HELLO, R PROGRAMMING!"
tolower(s)                  # "hello, r programming!"
substr(s, 1, 5)             # "Hello"
substring(s, 8)             # "R Programming!"

# Concatenation
paste("Hello", "World")           # "Hello World"
paste0("Hello", "World")          # "HelloWorld" (no space)
paste(1:3, collapse="-")          # "1-2-3"

# Splitting
strsplit("apple,banana,cherry", ",")[[1]]
# [1] "apple"  "banana" "cherry"

# Replacing
gsub("o", "0", "Hello World")   # "Hell0 W0rld" — replace all
sub("o", "0", "Hello World")    # "Hell0 World"  — replace first

# Trimming whitespace
trimws("  hello  ")        # "hello"
trimws("  hello  ", "left")  # "hello  "

# Searching
grepl("R", s)              # TRUE — does "R" appear?
grep("a", c("apple","banana","cherry"))  # 1 2 — indices

# Formatting
sprintf("Name: %s, Age: %d, Score: %.2f", "Amr", 35, 92.5)
# "Name: Amr, Age: 35, Score: 92.50"

# ── stringr PACKAGE ───────────────────────────────────────────
library(stringr)

x <- "  Data Science with R  "

str_trim(x)                    # "Data Science with R"
str_length(x)                  # 23
str_to_upper(x)                # "  DATA SCIENCE WITH R  "
str_to_title("hello world")    # "Hello World"

str_detect("Toronto", "onto")  # TRUE
str_replace("foo bar foo", "foo", "baz")    # "baz bar foo"
str_replace_all("foo bar foo", "foo","baz") # "baz bar baz"

str_split("a,b,c,d", ",")[[1]]  # "a" "b" "c" "d"
str_sub("Hello World", 1, 5)    # "Hello"

str_pad("42", width=6, side="left", pad="0")  # "000042"
str_wrap("This is a long sentence that needs to be wrapped.", width=20)

# Extract with regex
emails <- c("amr@gmail.com","user@yahoo.com","bad-email")
str_extract(emails, "[a-z]+@[a-z]+\\.[a-z]+")
