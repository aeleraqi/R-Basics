# ============================================================
# 10_statistics.R
# R Basics - Statistical Analysis
# Author: Amr Eleraqi | github.com/aeleraqi
# ============================================================

# ── DESCRIPTIVE STATISTICS ────────────────────────────────────
data(mtcars)
x <- mtcars$mpg

mean(x)       # Arithmetic mean
median(x)     # Median
sd(x)         # Standard deviation
var(x)        # Variance
range(x)      # Min and max
quantile(x)   # 0% 25% 50% 75% 100%
quantile(x, 0.90)  # 90th percentile
IQR(x)        # Interquartile range
summary(x)    # Full summary

# Mode (R has no built-in mode())
mode_r <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}
mode_r(c(1,2,2,3,3,3,4))  # 3

# ── CORRELATION ───────────────────────────────────────────────
cor(mtcars$mpg, mtcars$wt)    # Pearson correlation
cor(mtcars$mpg, mtcars$wt, method="spearman")  # Spearman

cor(mtcars[, c("mpg","wt","hp","cyl")])  # Correlation matrix

# Significance test
cor.test(mtcars$mpg, mtcars$wt)
# Shows: t, df, p-value, 95% CI, correlation estimate

# ── T-TESTS ───────────────────────────────────────────────────
# One-sample t-test: Is mean mpg different from 20?
t.test(mtcars$mpg, mu=20)

# Two-sample t-test: Auto vs Manual transmission
auto   <- mtcars$mpg[mtcars$am == 0]
manual <- mtcars$mpg[mtcars$am == 1]
t.test(auto, manual)
# Conclusion: manual cars have significantly higher MPG

# Paired t-test
before <- c(80, 82, 85, 79, 88)
after  <- c(75, 78, 80, 76, 84)
t.test(before, after, paired=TRUE)

# ── ANOVA — Compare 3+ groups ────────────────────────────────
# Does MPG differ by cylinder count?
aov_result <- aov(mpg ~ factor(cyl), data=mtcars)
summary(aov_result)
# If p < 0.05, at least one group differs significantly

# Post-hoc: Which groups differ?
TukeyHSD(aov_result)

# ── CHI-SQUARE TEST ────────────────────────────────────────────
# Test if two categorical variables are independent
chisq.test(table(mtcars$cyl, mtcars$am))

# ── LINEAR REGRESSION ─────────────────────────────────────────
model <- lm(mpg ~ wt + hp, data=mtcars)
summary(model)
# Shows: coefficients, R-squared, F-statistic, p-values

# Predictions
predict(model, newdata=data.frame(wt=3.0, hp=150))

# Residuals
residuals(model)
plot(model)   # Diagnostic plots

# ── MULTIPLE REGRESSION ───────────────────────────────────────
full_model <- lm(mpg ~ wt + hp + cyl + am, data=mtcars)
summary(full_model)

# Model comparison
anova(model, full_model)

# ── NORMALITY TESTS ───────────────────────────────────────────
shapiro.test(mtcars$mpg)   # Shapiro-Wilk test
# p > 0.05 → fail to reject normality

hist(mtcars$mpg, prob=TRUE, main="MPG Distribution")
lines(density(mtcars$mpg), col="red", lwd=2)
