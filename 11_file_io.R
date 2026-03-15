# ============================================================
# 11_file_io.R
# R Basics - Reading and Writing Files
# Author: Amr Eleraqi | github.com/aeleraqi
# ============================================================

# ── CSV FILES ─────────────────────────────────────────────────
# Write a CSV
students <- data.frame(
  name  = c("Alice","Bob","Charlie"),
  score = c(92, 85, 78),
  grade = c("A","B","C")
)
write.csv(students, "students.csv", row.names=FALSE)

# Read a CSV
df <- read.csv("students.csv")
print(df)

# read.csv with options
df2 <- read.csv("students.csv",
                header    = TRUE,
                sep       = ",",
                na.strings = c("","NA","N/A"),
                stringsAsFactors = FALSE)

# Faster reading with readr
library(readr)
df3 <- read_csv("students.csv")     # Returns a tibble
write_csv(df3, "output.csv")

# ── EXCEL FILES ───────────────────────────────────────────────
library(readxl)
library(writexl)

# Write Excel
write_xlsx(students, "students.xlsx")

# Read Excel
df_xl <- read_excel("students.xlsx", sheet=1)
df_xl2 <- read_excel("students.xlsx", range="A1:C4")

# ── RDS FILES — Save/load R objects ───────────────────────────
my_model <- lm(mpg ~ wt, data=mtcars)
saveRDS(my_model, "model.rds")
loaded_model <- readRDS("model.rds")
summary(loaded_model)

# ── RDATA — Save multiple objects ─────────────────────────────
x <- 1:10
y <- "hello"
save(x, y, file="workspace.RData")
load("workspace.RData")

# ── TEXT FILES ────────────────────────────────────────────────
writeLines(c("Line 1","Line 2","Line 3"), "text_file.txt")
lines <- readLines("text_file.txt")
cat(lines, sep="\n")

# ── JSON ──────────────────────────────────────────────────────
library(jsonlite)
json_str <- toJSON(students, pretty=TRUE)
cat(json_str)
df_from_json <- fromJSON(json_str)

# ── WORKING DIRECTORY ─────────────────────────────────────────
getwd()            # Show current directory
setwd("/path/to/your/folder")  # Change directory
list.files()       # List files in directory
