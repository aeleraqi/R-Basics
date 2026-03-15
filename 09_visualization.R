# ============================================================
# 09_visualization.R
# R Basics - Data Visualization with ggplot2
# Author: Amr Eleraqi | github.com/aeleraqi
# ============================================================

library(ggplot2)

# ── GGPLOT2 BASICS ────────────────────────────────────────────
# Grammar: ggplot(data, aes(x, y)) + geom_*() + theme_*()

# Use built-in datasets
data(mtcars)
data(iris)

# ── 1. BAR CHART ──────────────────────────────────────────────
cylinder_counts <- as.data.frame(table(mtcars$cyl))
colnames(cylinder_counts) <- c("cylinders", "count")

ggplot(cylinder_counts, aes(x=cylinders, y=count, fill=cylinders)) +
  geom_col() +
  labs(title="Cars by Number of Cylinders",
       x="Cylinders", y="Count") +
  theme_minimal() +
  scale_fill_brewer(palette="Set2")

# ── 2. HISTOGRAM ──────────────────────────────────────────────
ggplot(mtcars, aes(x=mpg)) +
  geom_histogram(binwidth=3, fill="steelblue", color="white", alpha=0.8) +
  labs(title="Distribution of Miles Per Gallon",
       x="MPG", y="Frequency") +
  theme_minimal()

# ── 3. SCATTER PLOT ───────────────────────────────────────────
ggplot(mtcars, aes(x=wt, y=mpg, color=factor(cyl), size=hp)) +
  geom_point(alpha=0.7) +
  geom_smooth(method="lm", se=FALSE, color="black", linetype="dashed") +
  labs(title="MPG vs Weight by Cylinders",
       x="Weight (1000 lbs)", y="Miles Per Gallon",
       color="Cylinders", size="Horsepower") +
  theme_minimal()

# ── 4. LINE CHART ──────────────────────────────────────────────
# Create time-series style data
year_data <- data.frame(
  year  = 2018:2024,
  value = c(120, 135, 128, 145, 162, 158, 175)
)

ggplot(year_data, aes(x=year, y=value)) +
  geom_line(color="steelblue", size=1.2) +
  geom_point(color="steelblue", size=3) +
  geom_text(aes(label=value), vjust=-0.8, size=3.5) +
  labs(title="Annual Performance", x="Year", y="Value") +
  theme_minimal()

# ── 5. BOX PLOT ────────────────────────────────────────────────
ggplot(iris, aes(x=Species, y=Sepal.Length, fill=Species)) +
  geom_boxplot(alpha=0.7, outlier.color="red") +
  labs(title="Sepal Length by Iris Species",
       x="Species", y="Sepal Length (cm)") +
  theme_minimal() +
  scale_fill_brewer(palette="Pastel1")

# ── 6. FACETED PLOTS ──────────────────────────────────────────
ggplot(iris, aes(x=Sepal.Length, y=Petal.Length, color=Species)) +
  geom_point(alpha=0.7) +
  facet_wrap(~Species) +
  labs(title="Sepal vs Petal Length by Species") +
  theme_minimal()

# ── 7. HEATMAP (Correlation) ──────────────────────────────────
library(reshape2)
cor_matrix <- round(cor(mtcars), 2)
melted <- melt(cor_matrix)

ggplot(melted, aes(x=Var1, y=Var2, fill=value)) +
  geom_tile(color="white") +
  scale_fill_gradient2(low="blue", mid="white", high="red",
                       midpoint=0, limits=c(-1,1)) +
  geom_text(aes(label=value), size=2.5) +
  labs(title="Correlation Heatmap - mtcars",
       x=NULL, y=NULL, fill="Correlation") +
  theme_minimal() +
  theme(axis.text.x=element_text(angle=45, hjust=1))

# ── Saving plots ──────────────────────────────────────────────
# ggsave("my_plot.png", width=8, height=6, dpi=300)
