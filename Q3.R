# PART3 : Hypothesis testing for standard deviation

library(data.table)
library(TeachingDemos) #for sigma.test function

my_avocado_data <- read.csv("avocado.csv", sep = ",", header = T)
atlanta_data <- subset(my_avocado_data, region == "Atlanta")
atlanta <- atlanta_data$Total.Volume

# 1. State the hypothesis.
# H0(Null hypothesis): standard deviation of total amount of avocado sold (in volume) in Atlanta region is equal to 200000(test value)
# H1(alternative hypothesis): standard deviation of total amount of avocado sold (in volume)in Atlanta region is greater than 200000(test value)

test_sigma <- 200000

# 2. Compute the test statistic.
sigma.test(atlanta, sigma = test_sigma, sigmasq = test_sigma^2, alternative = "greater", conf.level = 0.95)
chisquare_value <- (nrow(atlanta_data) - 1) * (var(atlanta)) / ((test_sigma)^2)

# 3. Interpret the results.
# chisquare_value =583.22  with df = 337 and p-value = 1.887e-15 which means 0.000000000000001887 (conf. level = 0.95 then alpha = 0.05)
# reject null hypothesis in favor of alternative hypothesis.
# standard deviation of total amount of avocado sold in Atlanta region is greater than 200000 (it is 263107.1)
